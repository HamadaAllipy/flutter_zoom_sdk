import 'dart:async';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'zoom_options_android.dart';
import 'zoom_view_android.dart';
export 'zoom_options_android.dart';

abstract class ZoomPlatformAndroid extends PlatformInterface {
  ZoomPlatformAndroid() : super(token: _token);
  static final Object _token = Object();
  static ZoomPlatformAndroid _instance = ZoomViewAndroid();
  static ZoomPlatformAndroid get instance => _instance;
  static set instance(ZoomPlatformAndroid instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Flutter Zoom SDK Initialization function
  Future<List> initZoom(ZoomOptionsAndroid options) async {
    throw UnimplementedError('initZoom() has not been implemented.');
  }

  /// Flutter Zoom SDK Start Meeting function
  Future<List> startMeeting(ZoomMeetingOptionsAndroid options) async {
    throw UnimplementedError('startMeetingLogin() has not been implemented.');
  }

  /// Flutter Zoom SDK Join Meeting function
  Future<bool> joinMeeting(ZoomMeetingOptionsAndroid options) async {
    throw UnimplementedError('joinMeeting() has not been implemented.');
  }

  /// Flutter Zoom SDK Return To Meeting function
  Future<bool> returnToMeeting() async {
    throw UnimplementedError('returnToMeeting() has not been implemented.');
  }

  /// Flutter Zoom SDK Get Meeting Status function
  Future<List> meetingStatus(String meetingId) async {
    throw UnimplementedError('meetingStatus() has not been implemented.');
  }

  /// Flutter Zoom SDK Listen to Meeting Status function
  Stream<dynamic> onMeetingStatus() {
    throw UnimplementedError('onMeetingStatus() has not been implemented.');
  }

  /// Flutter Zoom SDK Get Meeting ID & Passcode after Starting Meeting function
  Future<List> meetinDetails() async {
    throw UnimplementedError('meetingDetails() has not been implemented.');
  }

  /// Flutter Zoom SDK Un initialize
  Future<bool> unInitialize() async {
    throw UnimplementedError('meetingDetails() has not been implemented.');
  }
}
