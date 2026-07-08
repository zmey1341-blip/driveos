import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/obd_models.dart';

final obdConnectedProvider = StateProvider<bool>((ref) {
  return false;
});

final obdErrorsProvider = StateProvider<List<OBDError>>((ref) {
  return [];
});

final obdParametersProvider = StateProvider<List<OBDParameter>>((ref) {
  return [];
});
