import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  late ConnectivityResult _connectionStatus;

  Future<void> init() async {
    _connectionStatus = await _connectivity.checkConnectivity();
  }

  Future<bool> isConnected() async {
    _connectionStatus = await _connectivity.checkConnectivity();
    return _connectionStatus != ConnectivityResult.none;
  }

  ConnectivityResult get connectionStatus => _connectionStatus;

  bool get hasConnection => _connectionStatus != ConnectivityResult.none;

  bool get isMobile => _connectionStatus == ConnectivityResult.mobile;

  bool get isWifi => _connectionStatus == ConnectivityResult.wifi;
}
