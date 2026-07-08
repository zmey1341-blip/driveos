import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/vehicle_models.dart';

final currentVehicleProvider = StateProvider<Vehicle?>((ref) {
  return null;
});

final vehiclesListProvider = StateProvider<List<Vehicle>>((ref) {
  return [];
});

final vehicleServiceRecordsProvider = FutureProvider((ref) async {
  return <VehicleServiceRecord>[];
});
