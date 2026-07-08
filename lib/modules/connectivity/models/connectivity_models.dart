class ConnectivityStatus {
  final bool hasInternet;
  final bool hasGPS;
  final bool hasGSM;
  final bool hasWiFi;
  final bool hasBluetooth;
  final String? networkType; // 4G, 5G, WiFi
  final double? signalStrength;

  ConnectivityStatus({
    required this.hasInternet,
    required this.hasGPS,
    required this.hasGSM,
    required this.hasWiFi,
    required this.hasBluetooth,
    this.networkType,
    this.signalStrength,
  });
}
