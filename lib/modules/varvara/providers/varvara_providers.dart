import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/varvara_personality.dart';
import '../services/varvara_service.dart';

final selectedPersonalityProvider = StateProvider<VarvaraPersonality>((ref) {
  return VarvaraPersonality.defaultPersonalities[0];
});

final varvaraListeningProvider = StateProvider<bool>((ref) {
  return false;
});

final varvaraMessageProvider = StateProvider<String>((ref) {
  return '';
});

final varvaraMemoryProvider = FutureProvider((ref) async {
  return {};
});
