class AppConstants {
  // App Info
  static const String appName = 'DriveOS';
  static const String appVersion = '0.1.0';
  static const String appBuildNumber = '1';

  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Trip Detection
  static const Duration tripDetectionTimeout = Duration(seconds: 120);
  static const Duration tripEndTimeout = Duration(minutes: 5);

  // Animation Durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 500);
  static const Duration longAnimationDuration = Duration(milliseconds: 1000);
  static const Duration splashAnimationDuration = Duration(seconds: 3);

  // OBD
  static const int obdConnectRetries = 3;
  static const Duration obdConnectionTimeout = Duration(seconds: 10);

  // Music
  static const int musicRetries = 3;

  // Varvara
  static const String varvaraWakeWord = 'Варвара';
  static const Duration varvaraListeningTimeout = Duration(seconds: 10);
}

class ApiConstants {
  static const String baseUrl = 'https://api.driveos.local';
  static const String knowledgeBaseUrl = 'https://kb.driveos.local';
}

class ErrorMessages {
  static const String noInternet = 'No internet connection';
  static const String connectionTimeout = 'Connection timeout';
  static const String unknownError = 'An unknown error occurred';
  static const String obdConnectionFailed = 'Failed to connect to OBD';
  static const String gpsUnavailable = 'GPS unavailable';
  static const String bluetoothUnavailable = 'Bluetooth unavailable';
}
