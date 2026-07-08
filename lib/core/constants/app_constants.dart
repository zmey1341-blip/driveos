import 'package:flutter/material.dart';

class AppConstants {
  // App Info
  static const String appName = 'DriveOS';
  static const String appVersion = '1.0.0';
  static const String appPackage = 'com.zmey1341.driveos';

  // Network
  static const int connectionTimeout = 30;
  static const int readTimeout = 30;

  // Storage
  static const int maxCacheSizeMB = 500;
  static const int maxDashCamStorageMB = 2000;

  // UI
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 12.0;

  // Voice
  static const String voiceLanguage = 'ru-RU';
  static const double speechRate = 0.5;
}
