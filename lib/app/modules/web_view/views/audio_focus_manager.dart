import 'dart:async';
import 'package:flutter/services.dart';

class AudioFocusManager {
  static const MethodChannel _channel = MethodChannel('audio_focus');

  static Future<void> requestAudioFocus() async {
    try {
      await _channel.invokeMethod('requestAudioFocus');
    } on PlatformException catch (e) {
      print('Error requesting audio focus: $e');
    }
  }

  static Future<void> releaseAudioFocus() async {
    try {
      await _channel.invokeMethod('releaseAudioFocus');
    } on PlatformException catch (e) {
      print('Error releasing audio focus: $e');
    }
  }
}
