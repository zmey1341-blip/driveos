import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late SharedPreferences _prefs;
  static const String _vehiclesKey = 'vehicles';
  static const String _settingsKey = 'settings';
  static const String _generalKey = 'general';

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveVehicle(String vehicleId, Map<String, dynamic> data) async {
    final vehicles = getAllVehicles();
    vehicles[vehicleId] = data;
    await _prefs.setString(
      _vehiclesKey,
      jsonEncode(vehicles),
    );
  }

  Map<String, dynamic> getAllVehicles() {
    final data = _prefs.getString(_vehiclesKey);
    if (data == null) return {};
    return jsonDecode(data) as Map<String, dynamic>;
  }

  Future<void> deleteVehicle(String vehicleId) async {
    final vehicles = getAllVehicles();
    vehicles.remove(vehicleId);
    await _prefs.setString(
      _vehiclesKey,
      jsonEncode(vehicles),
    );
  }

  Future<void> saveSetting(String key, dynamic value) async {
    final settings = _prefs.getString(_settingsKey) ?? '{}';
    final settingsMap = jsonDecode(settings) as Map<String, dynamic>;
    settingsMap[key] = value;
    await _prefs.setString(
      _settingsKey,
      jsonEncode(settingsMap),
    );
  }

  dynamic getSetting(String key) {
    final settings = _prefs.getString(_settingsKey) ?? '{}';
    final settingsMap = jsonDecode(settings) as Map<String, dynamic>;
    return settingsMap[key];
  }

  Future<void> saveGeneral(String key, dynamic value) async {
    await _prefs.setString(key, value.toString());
  }

  String? getGeneral(String key) {
    return _prefs.getString(key);
  }

  Future<void> clear() async {
    await _prefs.clear();
  }
}
