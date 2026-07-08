class Environment {
  static const String appName = 'DriveOS';
  static const String appVersion = '1.0.0';
  static const String buildNumber = '1';

  // Feature Flags
  static const bool enableVarvara = true;
  static const bool enableNavigation = true;
  static const bool enableMusic = true;
  static const bool enableVehicleModule = true;
  static const bool enableOBD = true;
  static const bool enableDashCam = true;
  static const bool enableConnectivity = true;
  static const bool enableStorage = true;
  static const bool enableSecurity = true;
  static const bool enableNotifications = true;

  // Debug Settings
  static const bool enableDebugLogging = true;
  static const bool enablePerformanceMonitoring = true;

  // API Settings
  static const String apiBaseUrl = 'https://api.driveos.local';
  static const int apiTimeoutSeconds = 30;
}
