import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'fake_camera.dart';

class FakeCameraLocalVideoView extends StatefulWidget {
  const FakeCameraLocalVideoView(
      {Key? key,
      required this.rtcEngine,
      required this.onFirstFrame,
      required this.builder})
      : super(key: key);

  final VoidCallback onFirstFrame;
  final WidgetBuilder builder;
  final RtcEngine rtcEngine;

  @override
  State<FakeCameraLocalVideoView> createState() =>
      _FakeCameraLocalVideoViewState();
}

class _FakeCameraLocalVideoViewState extends State<FakeCameraLocalVideoView> {
  late final RtcEngine _rtcEngine;
  late final FakeCamera _fakeCamera;

  @override
  void initState() {
    super.initState();

    _init();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  Future<void> _init() async {
    _rtcEngine = widget.rtcEngine;

    await _rtcEngine.initialize(RtcEngineContext(
      appId: 'aab8b8f5a8cd4469a63042fcfafe7063',
      areaCode: AreaCode.areaCodeGlob.value(),
    ));

    _fakeCamera = FakeCamera(_rtcEngine);
    await _fakeCamera.initialize();
    _waitFirstFrame();

    await _rtcEngine.enableVideo();
  }

  Future<void> _waitFirstFrame() async {
    await _fakeCamera.onFirstFrame;
    widget.onFirstFrame();
  }

  Future<void> _dispose() async {
    await _fakeCamera.dispose();
    await _rtcEngine.release();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: widget.builder(context),
            ),
          ),
        ),
      ),
    );
  }
}
