import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:agora_rtc_engine_example/config/agora.config.dart' as config;
import 'package:agora_rtc_engine_example/components/example_actions_widget.dart';
import 'package:agora_rtc_engine_example/components/log_sink.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// PictureInPicture Example
class PictureInPicture extends StatefulWidget {
  /// Construct the [PictureInPicture]
  const PictureInPicture({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PictureInPicture> {
  late final RtcEngine _engine;

  bool isJoined = false,
      switchCamera = true,
      switchRender = true,
      openCamera = true,
      muteCamera = false,
      muteAllRemoteVideo = false;
  Set<int> remoteUid = {};
  late TextEditingController _controller;
  late final RtcEngineEventHandler _rtcEngineEventHandler;

  late final PIPVideoViewController _localVideoViewPipController;
  final Map<int, PIPVideoViewController> _remotePipControllers = {};
  bool _isInPipMode = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: config.channelId);

    _initEngine();
  }

  @override
  void dispose() {
    super.dispose();
    _dispose();
  }

  Future<void> _dispose() async {
    _engine.unregisterEventHandler(_rtcEngineEventHandler);
    await _engine.leaveChannel();
    await _engine.release();
  }

  Future<void> _initEngine() async {
    _engine = createAgoraRtcEngine();
    _localVideoViewPipController = PIPVideoViewController(
      rtcEngine: _engine,
      canvas: const VideoCanvas(
          uid: 0, setupMode: VideoViewSetupMode.videoViewSetupAdd),
    );

    await _engine.initialize(RtcEngineContext(
      appId: config.appId,
    ));
    _rtcEngineEventHandler = RtcEngineEventHandler(
      onError: (ErrorCodeType err, String msg) {
        logSink.log('[onError] err: $err, msg: $msg');
      },
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
        logSink.log(
            '[onJoinChannelSuccess] connection: ${connection.toJson()} elapsed: $elapsed');
        setState(() {
          isJoined = true;
        });
      },
      onUserJoined: (RtcConnection connection, int rUid, int elapsed) {
        logSink.log(
            '[onUserJoined] connection: ${connection.toJson()} remoteUid: $rUid elapsed: $elapsed');
        setState(() {
          remoteUid.add(rUid);
          _remotePipControllers.putIfAbsent(
              rUid,
              () => PIPVideoViewController.remote(
                    rtcEngine: _engine,
                    canvas: VideoCanvas(uid: rUid),
                    connection: RtcConnection(channelId: _controller.text),
                  ));
        });
      },
      onUserOffline:
          (RtcConnection connection, int rUid, UserOfflineReasonType reason) {
        logSink.log(
            '[onUserOffline] connection: ${connection.toJson()}  rUid: $rUid reason: $reason');
        setState(() {
          remoteUid.removeWhere((element) => element == rUid);
          _remotePipControllers.remove(rUid);
        });
      },
      onLeaveChannel: (RtcConnection connection, RtcStats stats) {
        logSink.log(
            '[onLeaveChannel] connection: ${connection.toJson()} stats: ${stats.toJson()}');
        setState(() {
          isJoined = false;
          remoteUid.clear();
          _remotePipControllers.forEach((key, value) {
            if (value.isInPictureInPictureMode) {
              value.stopPictureInPicture();
            }
          });
          _remotePipControllers.clear();
        });
      },
      onRemoteVideoStateChanged: (RtcConnection connection, int remoteUid,
          RemoteVideoState state, RemoteVideoStateReason reason, int elapsed) {
        logSink.log(
            '[onRemoteVideoStateChanged] connection: ${connection.toJson()} remoteUid: $remoteUid state: $state reason: $reason elapsed: $elapsed');
      },
      onPipStateChanged: (state) {
        logSink.log('[onPipStateChanged] state: $state');
        if (state == PipState.pipStateStopped) {
          if (_localVideoViewPipController.isInPictureInPictureMode) {
            _localVideoViewPipController.stopPictureInPicture();
          }

          _remotePipControllers.forEach((key, value) {
            if (value.isInPictureInPictureMode) {
              value.stopPictureInPicture();
            }
          });
        }

        setState(() {
          _isInPipMode = state == PipState.pipStateStarted;
        });
      },
    );

    _engine.registerEventHandler(_rtcEngineEventHandler);

    await _engine.enableVideo();
    await _engine.startPreview();
  }

  Future<void> _joinChannel() async {
    await _engine.joinChannel(
      token: config.token,
      channelId: _controller.text,
      uid: config.uid,
      options: const ChannelMediaOptions(
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
      ),
    );
  }

  Future<void> _leaveChannel() async {
    await _engine.leaveChannel();
    setState(() {
      openCamera = true;
      muteCamera = false;
      muteAllRemoteVideo = false;
    });
  }

  Widget _videoViewStack() {
    return Stack(
      children: [
        Stack(
          children: [
            AgoraVideoView(
              controller: _localVideoViewPipController,
              onAgoraVideoViewCreated: (viewId) {
                _engine.startPreview();
              },
            ),
            if (!_isInPipMode)
              Positioned(
                right: 0,
                bottom: 0,
                child: ElevatedButton(
                  onPressed: () {
                    // On Android, the width and height are used to calculate the aspect ratio,
                    // not the actual dimensions of the Picture-in-Picture window.
                    // For more details, see:
                    // https://developer.android.com/reference/android/app/PictureInPictureParams.Builder#setAspectRatio(android.util.Rational)
                    _localVideoViewPipController.startPictureInPicture(
                        const PipOptions(
                            contentWidth: 150,
                            contentHeight: 300,
                            autoEnterPip: true));
                  },
                  child: const Text('Enter PIP'),
                ),
              )
          ],
        ),
        Align(
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.of(_remotePipControllers.entries.map(
                (entry) => SizedBox(
                  width: 100,
                  height: 100,
                  child: Stack(
                    children: [
                      AgoraVideoView(
                        controller: entry.value,
                      ),
                      if (!kIsWeb &&
                          defaultTargetPlatform == TargetPlatform.iOS)
                        Positioned(
                            right: 0,
                            bottom: 0,
                            child: ElevatedButton(
                              onPressed: () {
                                entry.value.startPictureInPicture(
                                    const PipOptions(
                                        contentWidth: 150,
                                        contentHeight: 300,
                                        autoEnterPip: true));
                              },
                              child: const Text('Enter PIP'),
                            )),
                    ],
                  ),
                ),
              )),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // We only need to adjust the UI on Android in pip mode.
    if (_isInPipMode &&
        (!kIsWeb && defaultTargetPlatform == TargetPlatform.android)) {
      return _videoViewStack();
    }

    return ExampleActionsWidget(
      displayContentBuilder: (context, isLayoutHorizontal) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: _videoViewStack()),
            const SizedBox(
              height: 50,
            )
          ],
        );
      },
      actionsBuilder: (context, isLayoutHorizontal) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Channel ID'),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: isJoined ? _leaveChannel : _joinChannel,
                    child: Text('${isJoined ? 'Leave' : 'Join'} channel'),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
