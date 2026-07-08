import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/dashcam_models.dart';

final dashCamRecordingProvider = StateProvider<bool>((ref) {
  return false;
});

final dashCamEventsProvider = StateProvider<List<DashCamEvent>>((ref) {
  return [];
});

final dashCamRecordingsProvider = StateProvider<List<DashCamRecording>>((ref) {
  return [];
});
