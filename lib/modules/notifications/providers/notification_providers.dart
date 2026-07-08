import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationsProvider = StateProvider<List<String>>((ref) {
  return [];
});
