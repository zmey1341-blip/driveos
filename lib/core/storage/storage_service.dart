import 'package:hive_flutter/hive_flutter.dart';

class StorageService {
  late Box<dynamic> _generalBox;
  late Box<dynamic> _vehicleBox;
  late Box<dynamic> _tripsBox;
  late Box<dynamic> _settingsBox;

  Future<void> init() async {
    await Hive.initFlutter();
    _generalBox = await Hive.openBox('general');
    _vehicleBox = await Hive.openBox('vehicles');
    _tripsBox = await Hive.openBox('trips');
    _settingsBox = await Hive.openBox('settings');
  }

  // General
  Future<void> saveGeneral(String key, dynamic value) async {
    await _generalBox.put(key, value);
  }

  dynamic getGeneral(String key, {dynamic defaultValue}) {
    return _generalBox.get(key, defaultValue: defaultValue);
  }

  Future<void> deleteGeneral(String key) async {
    await _generalBox.delete(key);
  }

  // Vehicles
  Future<void> saveVehicle(String vehicleId, Map<String, dynamic> data) async {
    await _vehicleBox.put(vehicleId, data);
  }

  Map<String, dynamic>? getVehicle(String vehicleId) {
    return _vehicleBox.get(vehicleId);
  }

  List<Map<String, dynamic>> getAllVehicles() {
    return _vehicleBox.values.cast<Map<String, dynamic>>().toList();
  }

  Future<void> deleteVehicle(String vehicleId) async {
    await _vehicleBox.delete(vehicleId);
  }

  // Trips
  Future<void> saveTrip(String tripId, Map<String, dynamic> data) async {
    await _tripsBox.put(tripId, data);
  }

  List<Map<String, dynamic>> getAllTrips() {
    return _tripsBox.values.cast<Map<String, dynamic>>().toList();
  }

  // Settings
  Future<void> saveSetting(String key, dynamic value) async {
    await _settingsBox.put(key, value);
  }

  dynamic getSetting(String key, {dynamic defaultValue}) {
    return _settingsBox.get(key, defaultValue: defaultValue);
  }

  Future<void> clearAll() async {
    await Future.wait([
      _generalBox.clear(),
      _vehicleBox.clear(),
      _tripsBox.clear(),
      _settingsBox.clear(),
    ]);
  }
}
