/// GENERATED BY testcase_gen. DO NOT MODIFY BY HAND.

// ignore_for_file: deprecated_member_use,constant_identifier_names

import 'dart:async';
import 'dart:typed_data';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iris_tester/iris_tester.dart';
import 'package:iris_method_channel/iris_method_channel.dart';

import '../testcases/event_ids_mapping.dart';

void generatedTestCases(ValueGetter<IrisTester> irisTester) {
  testWidgets(
    'VideoFrameObserver.onCaptureVideoFrame',
    (WidgetTester tester) async {
      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));
      await rtcEngine.setParameters('{"rtc.enable_debug_log": true}');
      final mediaEngine = rtcEngine.getMediaEngine();

      final onCaptureVideoFrameCompleter = Completer<bool>();
      final theVideoFrameObserver = VideoFrameObserver(
        onCaptureVideoFrame:
            (VideoSourceType sourceType, VideoFrame videoFrame) {
          onCaptureVideoFrameCompleter.complete(true);
        },
      );

      mediaEngine.registerVideoFrameObserver(
        theVideoFrameObserver,
      );

// Delay 500 milliseconds to ensure the registerVideoFrameObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        VideoSourceType sourceType = VideoSourceType.videoSourceCameraPrimary;
        VideoPixelFormat videoFrameType = VideoPixelFormat.videoPixelDefault;
        VideoFrameMetaInfo? videoFrameMetaInfo = null;
        int hdr10MetadataInfoRedPrimaryX = 5;
        int hdr10MetadataInfoRedPrimaryY = 5;
        int hdr10MetadataInfoGreenPrimaryX = 5;
        int hdr10MetadataInfoGreenPrimaryY = 5;
        int hdr10MetadataInfoBluePrimaryX = 5;
        int hdr10MetadataInfoBluePrimaryY = 5;
        int hdr10MetadataInfoWhitePointX = 5;
        int hdr10MetadataInfoWhitePointY = 5;
        int hdr10MetadataInfoMaxMasteringLuminance = 5;
        int hdr10MetadataInfoMinMasteringLuminance = 5;
        int hdr10MetadataInfoMaxContentLightLevel = 5;
        int hdr10MetadataInfoMaxFrameAverageLightLevel = 5;
        Hdr10MetadataInfo videoFrameHdr10MetadataInfo = Hdr10MetadataInfo(
          redPrimaryX: hdr10MetadataInfoRedPrimaryX,
          redPrimaryY: hdr10MetadataInfoRedPrimaryY,
          greenPrimaryX: hdr10MetadataInfoGreenPrimaryX,
          greenPrimaryY: hdr10MetadataInfoGreenPrimaryY,
          bluePrimaryX: hdr10MetadataInfoBluePrimaryX,
          bluePrimaryY: hdr10MetadataInfoBluePrimaryY,
          whitePointX: hdr10MetadataInfoWhitePointX,
          whitePointY: hdr10MetadataInfoWhitePointY,
          maxMasteringLuminance: hdr10MetadataInfoMaxMasteringLuminance,
          minMasteringLuminance: hdr10MetadataInfoMinMasteringLuminance,
          maxContentLightLevel: hdr10MetadataInfoMaxContentLightLevel,
          maxFrameAverageLightLevel: hdr10MetadataInfoMaxFrameAverageLightLevel,
        );
        PrimaryID colorSpacePrimaries = PrimaryID.primaryidBt709;
        TransferID colorSpaceTransfer = TransferID.transferidBt709;
        MatrixID colorSpaceMatrix = MatrixID.matrixidRgb;
        RangeID colorSpaceRange = RangeID.rangeidInvalid;
        ColorSpace videoFrameColorSpace = ColorSpace(
          primaries: colorSpacePrimaries,
          transfer: colorSpaceTransfer,
          matrix: colorSpaceMatrix,
          range: colorSpaceRange,
        );
        int videoFrameWidth = 5;
        int videoFrameHeight = 5;
        int videoFrameYStride = 5;
        int videoFrameUStride = 5;
        int videoFrameVStride = 5;
        Uint8List videoFrameYBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        Uint8List videoFrameUBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        Uint8List videoFrameVBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        int videoFrameRotation = 5;
        int videoFrameRenderTimeMs = 5;
        int videoFrameAvsyncType = 5;
        Uint8List videoFrameMetadataBuffer =
            Uint8List.fromList([1, 1, 1, 1, 1]);
        int videoFrameMetadataSize = 5;
        int videoFrameTextureId = 5;
        List<double> videoFrameMatrix = List.filled(5, 5.0);
        Uint8List videoFrameAlphaBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        int videoFrameAlphaStitchMode = 5;
        Uint8List videoFramePixelBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        VideoFrame videoFrame = VideoFrame(
          type: videoFrameType,
          width: videoFrameWidth,
          height: videoFrameHeight,
          yStride: videoFrameYStride,
          uStride: videoFrameUStride,
          vStride: videoFrameVStride,
          yBuffer: videoFrameYBuffer,
          uBuffer: videoFrameUBuffer,
          vBuffer: videoFrameVBuffer,
          rotation: videoFrameRotation,
          renderTimeMs: videoFrameRenderTimeMs,
          avsyncType: videoFrameAvsyncType,
          metadataBuffer: videoFrameMetadataBuffer,
          metadataSize: videoFrameMetadataSize,
          textureId: videoFrameTextureId,
          matrix: videoFrameMatrix,
          alphaBuffer: videoFrameAlphaBuffer,
          alphaStitchMode: videoFrameAlphaStitchMode,
          pixelBuffer: videoFramePixelBuffer,
          metaInfo: videoFrameMetaInfo,
          hdr10MetadataInfo: videoFrameHdr10MetadataInfo,
          colorSpace: videoFrameColorSpace,
        );

        final eventJson = {
          'sourceType': sourceType.value(),
          'videoFrame': videoFrame.toJson(),
        };

        final eventIds =
            eventIdsMapping['VideoFrameObserver_onCaptureVideoFrame'] ?? [];
        for (final event in eventIds) {
          final ret = irisTester().fireEvent(event, params: eventJson);
          // Delay 200 milliseconds to ensure the callback is called.
          await Future.delayed(const Duration(milliseconds: 200));
          // TODO(littlegnal): Most of callbacks on web are not implemented, we're temporarily skip these callbacks at this time.
          if (kIsWeb && ret) {
            if (!onCaptureVideoFrameCompleter.isCompleted) {
              onCaptureVideoFrameCompleter.complete(true);
            }
          }
        }
      }

      final eventCalled = await onCaptureVideoFrameCompleter.future;
      expect(eventCalled, isTrue);

      {
        mediaEngine.unregisterVideoFrameObserver(
          theVideoFrameObserver,
        );
      }
// Delay 500 milliseconds to ensure the unregisterVideoFrameObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await rtcEngine.release();
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  testWidgets(
    'VideoFrameObserver.onPreEncodeVideoFrame',
    (WidgetTester tester) async {
      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));
      await rtcEngine.setParameters('{"rtc.enable_debug_log": true}');
      final mediaEngine = rtcEngine.getMediaEngine();

      final onPreEncodeVideoFrameCompleter = Completer<bool>();
      final theVideoFrameObserver = VideoFrameObserver(
        onPreEncodeVideoFrame:
            (VideoSourceType sourceType, VideoFrame videoFrame) {
          onPreEncodeVideoFrameCompleter.complete(true);
        },
      );

      mediaEngine.registerVideoFrameObserver(
        theVideoFrameObserver,
      );

// Delay 500 milliseconds to ensure the registerVideoFrameObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        VideoSourceType sourceType = VideoSourceType.videoSourceCameraPrimary;
        VideoPixelFormat videoFrameType = VideoPixelFormat.videoPixelDefault;
        VideoFrameMetaInfo? videoFrameMetaInfo = null;
        int hdr10MetadataInfoRedPrimaryX = 5;
        int hdr10MetadataInfoRedPrimaryY = 5;
        int hdr10MetadataInfoGreenPrimaryX = 5;
        int hdr10MetadataInfoGreenPrimaryY = 5;
        int hdr10MetadataInfoBluePrimaryX = 5;
        int hdr10MetadataInfoBluePrimaryY = 5;
        int hdr10MetadataInfoWhitePointX = 5;
        int hdr10MetadataInfoWhitePointY = 5;
        int hdr10MetadataInfoMaxMasteringLuminance = 5;
        int hdr10MetadataInfoMinMasteringLuminance = 5;
        int hdr10MetadataInfoMaxContentLightLevel = 5;
        int hdr10MetadataInfoMaxFrameAverageLightLevel = 5;
        Hdr10MetadataInfo videoFrameHdr10MetadataInfo = Hdr10MetadataInfo(
          redPrimaryX: hdr10MetadataInfoRedPrimaryX,
          redPrimaryY: hdr10MetadataInfoRedPrimaryY,
          greenPrimaryX: hdr10MetadataInfoGreenPrimaryX,
          greenPrimaryY: hdr10MetadataInfoGreenPrimaryY,
          bluePrimaryX: hdr10MetadataInfoBluePrimaryX,
          bluePrimaryY: hdr10MetadataInfoBluePrimaryY,
          whitePointX: hdr10MetadataInfoWhitePointX,
          whitePointY: hdr10MetadataInfoWhitePointY,
          maxMasteringLuminance: hdr10MetadataInfoMaxMasteringLuminance,
          minMasteringLuminance: hdr10MetadataInfoMinMasteringLuminance,
          maxContentLightLevel: hdr10MetadataInfoMaxContentLightLevel,
          maxFrameAverageLightLevel: hdr10MetadataInfoMaxFrameAverageLightLevel,
        );
        PrimaryID colorSpacePrimaries = PrimaryID.primaryidBt709;
        TransferID colorSpaceTransfer = TransferID.transferidBt709;
        MatrixID colorSpaceMatrix = MatrixID.matrixidRgb;
        RangeID colorSpaceRange = RangeID.rangeidInvalid;
        ColorSpace videoFrameColorSpace = ColorSpace(
          primaries: colorSpacePrimaries,
          transfer: colorSpaceTransfer,
          matrix: colorSpaceMatrix,
          range: colorSpaceRange,
        );
        int videoFrameWidth = 5;
        int videoFrameHeight = 5;
        int videoFrameYStride = 5;
        int videoFrameUStride = 5;
        int videoFrameVStride = 5;
        Uint8List videoFrameYBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        Uint8List videoFrameUBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        Uint8List videoFrameVBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        int videoFrameRotation = 5;
        int videoFrameRenderTimeMs = 5;
        int videoFrameAvsyncType = 5;
        Uint8List videoFrameMetadataBuffer =
            Uint8List.fromList([1, 1, 1, 1, 1]);
        int videoFrameMetadataSize = 5;
        int videoFrameTextureId = 5;
        List<double> videoFrameMatrix = List.filled(5, 5.0);
        Uint8List videoFrameAlphaBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        int videoFrameAlphaStitchMode = 5;
        Uint8List videoFramePixelBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        VideoFrame videoFrame = VideoFrame(
          type: videoFrameType,
          width: videoFrameWidth,
          height: videoFrameHeight,
          yStride: videoFrameYStride,
          uStride: videoFrameUStride,
          vStride: videoFrameVStride,
          yBuffer: videoFrameYBuffer,
          uBuffer: videoFrameUBuffer,
          vBuffer: videoFrameVBuffer,
          rotation: videoFrameRotation,
          renderTimeMs: videoFrameRenderTimeMs,
          avsyncType: videoFrameAvsyncType,
          metadataBuffer: videoFrameMetadataBuffer,
          metadataSize: videoFrameMetadataSize,
          textureId: videoFrameTextureId,
          matrix: videoFrameMatrix,
          alphaBuffer: videoFrameAlphaBuffer,
          alphaStitchMode: videoFrameAlphaStitchMode,
          pixelBuffer: videoFramePixelBuffer,
          metaInfo: videoFrameMetaInfo,
          hdr10MetadataInfo: videoFrameHdr10MetadataInfo,
          colorSpace: videoFrameColorSpace,
        );

        final eventJson = {
          'sourceType': sourceType.value(),
          'videoFrame': videoFrame.toJson(),
        };

        final eventIds =
            eventIdsMapping['VideoFrameObserver_onPreEncodeVideoFrame'] ?? [];
        for (final event in eventIds) {
          final ret = irisTester().fireEvent(event, params: eventJson);
          // Delay 200 milliseconds to ensure the callback is called.
          await Future.delayed(const Duration(milliseconds: 200));
          // TODO(littlegnal): Most of callbacks on web are not implemented, we're temporarily skip these callbacks at this time.
          if (kIsWeb && ret) {
            if (!onPreEncodeVideoFrameCompleter.isCompleted) {
              onPreEncodeVideoFrameCompleter.complete(true);
            }
          }
        }
      }

      final eventCalled = await onPreEncodeVideoFrameCompleter.future;
      expect(eventCalled, isTrue);

      {
        mediaEngine.unregisterVideoFrameObserver(
          theVideoFrameObserver,
        );
      }
// Delay 500 milliseconds to ensure the unregisterVideoFrameObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await rtcEngine.release();
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  testWidgets(
    'VideoFrameObserver.onMediaPlayerVideoFrame',
    (WidgetTester tester) async {
      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));
      await rtcEngine.setParameters('{"rtc.enable_debug_log": true}');
      final mediaEngine = rtcEngine.getMediaEngine();

      final onMediaPlayerVideoFrameCompleter = Completer<bool>();
      final theVideoFrameObserver = VideoFrameObserver(
        onMediaPlayerVideoFrame: (VideoFrame videoFrame, int mediaPlayerId) {
          onMediaPlayerVideoFrameCompleter.complete(true);
        },
      );

      mediaEngine.registerVideoFrameObserver(
        theVideoFrameObserver,
      );

// Delay 500 milliseconds to ensure the registerVideoFrameObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        VideoPixelFormat videoFrameType = VideoPixelFormat.videoPixelDefault;
        VideoFrameMetaInfo? videoFrameMetaInfo = null;
        int hdr10MetadataInfoRedPrimaryX = 5;
        int hdr10MetadataInfoRedPrimaryY = 5;
        int hdr10MetadataInfoGreenPrimaryX = 5;
        int hdr10MetadataInfoGreenPrimaryY = 5;
        int hdr10MetadataInfoBluePrimaryX = 5;
        int hdr10MetadataInfoBluePrimaryY = 5;
        int hdr10MetadataInfoWhitePointX = 5;
        int hdr10MetadataInfoWhitePointY = 5;
        int hdr10MetadataInfoMaxMasteringLuminance = 5;
        int hdr10MetadataInfoMinMasteringLuminance = 5;
        int hdr10MetadataInfoMaxContentLightLevel = 5;
        int hdr10MetadataInfoMaxFrameAverageLightLevel = 5;
        Hdr10MetadataInfo videoFrameHdr10MetadataInfo = Hdr10MetadataInfo(
          redPrimaryX: hdr10MetadataInfoRedPrimaryX,
          redPrimaryY: hdr10MetadataInfoRedPrimaryY,
          greenPrimaryX: hdr10MetadataInfoGreenPrimaryX,
          greenPrimaryY: hdr10MetadataInfoGreenPrimaryY,
          bluePrimaryX: hdr10MetadataInfoBluePrimaryX,
          bluePrimaryY: hdr10MetadataInfoBluePrimaryY,
          whitePointX: hdr10MetadataInfoWhitePointX,
          whitePointY: hdr10MetadataInfoWhitePointY,
          maxMasteringLuminance: hdr10MetadataInfoMaxMasteringLuminance,
          minMasteringLuminance: hdr10MetadataInfoMinMasteringLuminance,
          maxContentLightLevel: hdr10MetadataInfoMaxContentLightLevel,
          maxFrameAverageLightLevel: hdr10MetadataInfoMaxFrameAverageLightLevel,
        );
        PrimaryID colorSpacePrimaries = PrimaryID.primaryidBt709;
        TransferID colorSpaceTransfer = TransferID.transferidBt709;
        MatrixID colorSpaceMatrix = MatrixID.matrixidRgb;
        RangeID colorSpaceRange = RangeID.rangeidInvalid;
        ColorSpace videoFrameColorSpace = ColorSpace(
          primaries: colorSpacePrimaries,
          transfer: colorSpaceTransfer,
          matrix: colorSpaceMatrix,
          range: colorSpaceRange,
        );
        int videoFrameWidth = 5;
        int videoFrameHeight = 5;
        int videoFrameYStride = 5;
        int videoFrameUStride = 5;
        int videoFrameVStride = 5;
        Uint8List videoFrameYBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        Uint8List videoFrameUBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        Uint8List videoFrameVBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        int videoFrameRotation = 5;
        int videoFrameRenderTimeMs = 5;
        int videoFrameAvsyncType = 5;
        Uint8List videoFrameMetadataBuffer =
            Uint8List.fromList([1, 1, 1, 1, 1]);
        int videoFrameMetadataSize = 5;
        int videoFrameTextureId = 5;
        List<double> videoFrameMatrix = List.filled(5, 5.0);
        Uint8List videoFrameAlphaBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        int videoFrameAlphaStitchMode = 5;
        Uint8List videoFramePixelBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        VideoFrame videoFrame = VideoFrame(
          type: videoFrameType,
          width: videoFrameWidth,
          height: videoFrameHeight,
          yStride: videoFrameYStride,
          uStride: videoFrameUStride,
          vStride: videoFrameVStride,
          yBuffer: videoFrameYBuffer,
          uBuffer: videoFrameUBuffer,
          vBuffer: videoFrameVBuffer,
          rotation: videoFrameRotation,
          renderTimeMs: videoFrameRenderTimeMs,
          avsyncType: videoFrameAvsyncType,
          metadataBuffer: videoFrameMetadataBuffer,
          metadataSize: videoFrameMetadataSize,
          textureId: videoFrameTextureId,
          matrix: videoFrameMatrix,
          alphaBuffer: videoFrameAlphaBuffer,
          alphaStitchMode: videoFrameAlphaStitchMode,
          pixelBuffer: videoFramePixelBuffer,
          metaInfo: videoFrameMetaInfo,
          hdr10MetadataInfo: videoFrameHdr10MetadataInfo,
          colorSpace: videoFrameColorSpace,
        );
        int mediaPlayerId = 5;

        final eventJson = {
          'videoFrame': videoFrame.toJson(),
          'mediaPlayerId': mediaPlayerId,
        };

        final eventIds =
            eventIdsMapping['VideoFrameObserver_onMediaPlayerVideoFrame'] ?? [];
        for (final event in eventIds) {
          final ret = irisTester().fireEvent(event, params: eventJson);
          // Delay 200 milliseconds to ensure the callback is called.
          await Future.delayed(const Duration(milliseconds: 200));
          // TODO(littlegnal): Most of callbacks on web are not implemented, we're temporarily skip these callbacks at this time.
          if (kIsWeb && ret) {
            if (!onMediaPlayerVideoFrameCompleter.isCompleted) {
              onMediaPlayerVideoFrameCompleter.complete(true);
            }
          }
        }
      }

      final eventCalled = await onMediaPlayerVideoFrameCompleter.future;
      expect(eventCalled, isTrue);

      {
        mediaEngine.unregisterVideoFrameObserver(
          theVideoFrameObserver,
        );
      }
// Delay 500 milliseconds to ensure the unregisterVideoFrameObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await rtcEngine.release();
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  testWidgets(
    'VideoFrameObserver.onRenderVideoFrame',
    (WidgetTester tester) async {
      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));
      await rtcEngine.setParameters('{"rtc.enable_debug_log": true}');
      final mediaEngine = rtcEngine.getMediaEngine();

      final onRenderVideoFrameCompleter = Completer<bool>();
      final theVideoFrameObserver = VideoFrameObserver(
        onRenderVideoFrame:
            (String channelId, int remoteUid, VideoFrame videoFrame) {
          onRenderVideoFrameCompleter.complete(true);
        },
      );

      mediaEngine.registerVideoFrameObserver(
        theVideoFrameObserver,
      );

// Delay 500 milliseconds to ensure the registerVideoFrameObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        String channelId = "hello";
        int remoteUid = 5;
        VideoPixelFormat videoFrameType = VideoPixelFormat.videoPixelDefault;
        VideoFrameMetaInfo? videoFrameMetaInfo = null;
        int hdr10MetadataInfoRedPrimaryX = 5;
        int hdr10MetadataInfoRedPrimaryY = 5;
        int hdr10MetadataInfoGreenPrimaryX = 5;
        int hdr10MetadataInfoGreenPrimaryY = 5;
        int hdr10MetadataInfoBluePrimaryX = 5;
        int hdr10MetadataInfoBluePrimaryY = 5;
        int hdr10MetadataInfoWhitePointX = 5;
        int hdr10MetadataInfoWhitePointY = 5;
        int hdr10MetadataInfoMaxMasteringLuminance = 5;
        int hdr10MetadataInfoMinMasteringLuminance = 5;
        int hdr10MetadataInfoMaxContentLightLevel = 5;
        int hdr10MetadataInfoMaxFrameAverageLightLevel = 5;
        Hdr10MetadataInfo videoFrameHdr10MetadataInfo = Hdr10MetadataInfo(
          redPrimaryX: hdr10MetadataInfoRedPrimaryX,
          redPrimaryY: hdr10MetadataInfoRedPrimaryY,
          greenPrimaryX: hdr10MetadataInfoGreenPrimaryX,
          greenPrimaryY: hdr10MetadataInfoGreenPrimaryY,
          bluePrimaryX: hdr10MetadataInfoBluePrimaryX,
          bluePrimaryY: hdr10MetadataInfoBluePrimaryY,
          whitePointX: hdr10MetadataInfoWhitePointX,
          whitePointY: hdr10MetadataInfoWhitePointY,
          maxMasteringLuminance: hdr10MetadataInfoMaxMasteringLuminance,
          minMasteringLuminance: hdr10MetadataInfoMinMasteringLuminance,
          maxContentLightLevel: hdr10MetadataInfoMaxContentLightLevel,
          maxFrameAverageLightLevel: hdr10MetadataInfoMaxFrameAverageLightLevel,
        );
        PrimaryID colorSpacePrimaries = PrimaryID.primaryidBt709;
        TransferID colorSpaceTransfer = TransferID.transferidBt709;
        MatrixID colorSpaceMatrix = MatrixID.matrixidRgb;
        RangeID colorSpaceRange = RangeID.rangeidInvalid;
        ColorSpace videoFrameColorSpace = ColorSpace(
          primaries: colorSpacePrimaries,
          transfer: colorSpaceTransfer,
          matrix: colorSpaceMatrix,
          range: colorSpaceRange,
        );
        int videoFrameWidth = 5;
        int videoFrameHeight = 5;
        int videoFrameYStride = 5;
        int videoFrameUStride = 5;
        int videoFrameVStride = 5;
        Uint8List videoFrameYBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        Uint8List videoFrameUBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        Uint8List videoFrameVBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        int videoFrameRotation = 5;
        int videoFrameRenderTimeMs = 5;
        int videoFrameAvsyncType = 5;
        Uint8List videoFrameMetadataBuffer =
            Uint8List.fromList([1, 1, 1, 1, 1]);
        int videoFrameMetadataSize = 5;
        int videoFrameTextureId = 5;
        List<double> videoFrameMatrix = List.filled(5, 5.0);
        Uint8List videoFrameAlphaBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        int videoFrameAlphaStitchMode = 5;
        Uint8List videoFramePixelBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        VideoFrame videoFrame = VideoFrame(
          type: videoFrameType,
          width: videoFrameWidth,
          height: videoFrameHeight,
          yStride: videoFrameYStride,
          uStride: videoFrameUStride,
          vStride: videoFrameVStride,
          yBuffer: videoFrameYBuffer,
          uBuffer: videoFrameUBuffer,
          vBuffer: videoFrameVBuffer,
          rotation: videoFrameRotation,
          renderTimeMs: videoFrameRenderTimeMs,
          avsyncType: videoFrameAvsyncType,
          metadataBuffer: videoFrameMetadataBuffer,
          metadataSize: videoFrameMetadataSize,
          textureId: videoFrameTextureId,
          matrix: videoFrameMatrix,
          alphaBuffer: videoFrameAlphaBuffer,
          alphaStitchMode: videoFrameAlphaStitchMode,
          pixelBuffer: videoFramePixelBuffer,
          metaInfo: videoFrameMetaInfo,
          hdr10MetadataInfo: videoFrameHdr10MetadataInfo,
          colorSpace: videoFrameColorSpace,
        );

        final eventJson = {
          'channelId': channelId,
          'remoteUid': remoteUid,
          'videoFrame': videoFrame.toJson(),
        };

        final eventIds =
            eventIdsMapping['VideoFrameObserver_onRenderVideoFrame'] ?? [];
        for (final event in eventIds) {
          final ret = irisTester().fireEvent(event, params: eventJson);
          // Delay 200 milliseconds to ensure the callback is called.
          await Future.delayed(const Duration(milliseconds: 200));
          // TODO(littlegnal): Most of callbacks on web are not implemented, we're temporarily skip these callbacks at this time.
          if (kIsWeb && ret) {
            if (!onRenderVideoFrameCompleter.isCompleted) {
              onRenderVideoFrameCompleter.complete(true);
            }
          }
        }
      }

      final eventCalled = await onRenderVideoFrameCompleter.future;
      expect(eventCalled, isTrue);

      {
        mediaEngine.unregisterVideoFrameObserver(
          theVideoFrameObserver,
        );
      }
// Delay 500 milliseconds to ensure the unregisterVideoFrameObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await rtcEngine.release();
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );

  testWidgets(
    'VideoFrameObserver.onTranscodedVideoFrame',
    (WidgetTester tester) async {
      RtcEngine rtcEngine = createAgoraRtcEngine();
      await rtcEngine.initialize(RtcEngineContext(
        appId: 'app_id',
        areaCode: AreaCode.areaCodeGlob.value(),
      ));
      await rtcEngine.setParameters('{"rtc.enable_debug_log": true}');
      final mediaEngine = rtcEngine.getMediaEngine();

      final onTranscodedVideoFrameCompleter = Completer<bool>();
      final theVideoFrameObserver = VideoFrameObserver(
        onTranscodedVideoFrame: (VideoFrame videoFrame) {
          onTranscodedVideoFrameCompleter.complete(true);
        },
      );

      mediaEngine.registerVideoFrameObserver(
        theVideoFrameObserver,
      );

// Delay 500 milliseconds to ensure the registerVideoFrameObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      {
        VideoPixelFormat videoFrameType = VideoPixelFormat.videoPixelDefault;
        VideoFrameMetaInfo? videoFrameMetaInfo = null;
        int hdr10MetadataInfoRedPrimaryX = 5;
        int hdr10MetadataInfoRedPrimaryY = 5;
        int hdr10MetadataInfoGreenPrimaryX = 5;
        int hdr10MetadataInfoGreenPrimaryY = 5;
        int hdr10MetadataInfoBluePrimaryX = 5;
        int hdr10MetadataInfoBluePrimaryY = 5;
        int hdr10MetadataInfoWhitePointX = 5;
        int hdr10MetadataInfoWhitePointY = 5;
        int hdr10MetadataInfoMaxMasteringLuminance = 5;
        int hdr10MetadataInfoMinMasteringLuminance = 5;
        int hdr10MetadataInfoMaxContentLightLevel = 5;
        int hdr10MetadataInfoMaxFrameAverageLightLevel = 5;
        Hdr10MetadataInfo videoFrameHdr10MetadataInfo = Hdr10MetadataInfo(
          redPrimaryX: hdr10MetadataInfoRedPrimaryX,
          redPrimaryY: hdr10MetadataInfoRedPrimaryY,
          greenPrimaryX: hdr10MetadataInfoGreenPrimaryX,
          greenPrimaryY: hdr10MetadataInfoGreenPrimaryY,
          bluePrimaryX: hdr10MetadataInfoBluePrimaryX,
          bluePrimaryY: hdr10MetadataInfoBluePrimaryY,
          whitePointX: hdr10MetadataInfoWhitePointX,
          whitePointY: hdr10MetadataInfoWhitePointY,
          maxMasteringLuminance: hdr10MetadataInfoMaxMasteringLuminance,
          minMasteringLuminance: hdr10MetadataInfoMinMasteringLuminance,
          maxContentLightLevel: hdr10MetadataInfoMaxContentLightLevel,
          maxFrameAverageLightLevel: hdr10MetadataInfoMaxFrameAverageLightLevel,
        );
        PrimaryID colorSpacePrimaries = PrimaryID.primaryidBt709;
        TransferID colorSpaceTransfer = TransferID.transferidBt709;
        MatrixID colorSpaceMatrix = MatrixID.matrixidRgb;
        RangeID colorSpaceRange = RangeID.rangeidInvalid;
        ColorSpace videoFrameColorSpace = ColorSpace(
          primaries: colorSpacePrimaries,
          transfer: colorSpaceTransfer,
          matrix: colorSpaceMatrix,
          range: colorSpaceRange,
        );
        int videoFrameWidth = 5;
        int videoFrameHeight = 5;
        int videoFrameYStride = 5;
        int videoFrameUStride = 5;
        int videoFrameVStride = 5;
        Uint8List videoFrameYBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        Uint8List videoFrameUBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        Uint8List videoFrameVBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        int videoFrameRotation = 5;
        int videoFrameRenderTimeMs = 5;
        int videoFrameAvsyncType = 5;
        Uint8List videoFrameMetadataBuffer =
            Uint8List.fromList([1, 1, 1, 1, 1]);
        int videoFrameMetadataSize = 5;
        int videoFrameTextureId = 5;
        List<double> videoFrameMatrix = List.filled(5, 5.0);
        Uint8List videoFrameAlphaBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        int videoFrameAlphaStitchMode = 5;
        Uint8List videoFramePixelBuffer = Uint8List.fromList([1, 1, 1, 1, 1]);
        VideoFrame videoFrame = VideoFrame(
          type: videoFrameType,
          width: videoFrameWidth,
          height: videoFrameHeight,
          yStride: videoFrameYStride,
          uStride: videoFrameUStride,
          vStride: videoFrameVStride,
          yBuffer: videoFrameYBuffer,
          uBuffer: videoFrameUBuffer,
          vBuffer: videoFrameVBuffer,
          rotation: videoFrameRotation,
          renderTimeMs: videoFrameRenderTimeMs,
          avsyncType: videoFrameAvsyncType,
          metadataBuffer: videoFrameMetadataBuffer,
          metadataSize: videoFrameMetadataSize,
          textureId: videoFrameTextureId,
          matrix: videoFrameMatrix,
          alphaBuffer: videoFrameAlphaBuffer,
          alphaStitchMode: videoFrameAlphaStitchMode,
          pixelBuffer: videoFramePixelBuffer,
          metaInfo: videoFrameMetaInfo,
          hdr10MetadataInfo: videoFrameHdr10MetadataInfo,
          colorSpace: videoFrameColorSpace,
        );

        final eventJson = {
          'videoFrame': videoFrame.toJson(),
        };

        final eventIds =
            eventIdsMapping['VideoFrameObserver_onTranscodedVideoFrame'] ?? [];
        for (final event in eventIds) {
          final ret = irisTester().fireEvent(event, params: eventJson);
          // Delay 200 milliseconds to ensure the callback is called.
          await Future.delayed(const Duration(milliseconds: 200));
          // TODO(littlegnal): Most of callbacks on web are not implemented, we're temporarily skip these callbacks at this time.
          if (kIsWeb && ret) {
            if (!onTranscodedVideoFrameCompleter.isCompleted) {
              onTranscodedVideoFrameCompleter.complete(true);
            }
          }
        }
      }

      final eventCalled = await onTranscodedVideoFrameCompleter.future;
      expect(eventCalled, isTrue);

      {
        mediaEngine.unregisterVideoFrameObserver(
          theVideoFrameObserver,
        );
      }
// Delay 500 milliseconds to ensure the unregisterVideoFrameObserver call completed.
      await Future.delayed(const Duration(milliseconds: 500));

      await rtcEngine.release();
    },
    timeout: const Timeout(Duration(minutes: 2)),
  );
}
