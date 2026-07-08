import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/connectivity_models.dart';

final connectivityStatusProvider = StateProvider<ConnectivityStatus>((ref) {
  return ConnectivityStatus(
    hasInternet: false,
    hasGPS: false,
    hasGSM: false,
    hasWiFi: false,
    hasBluetooth: false,
  );
});
