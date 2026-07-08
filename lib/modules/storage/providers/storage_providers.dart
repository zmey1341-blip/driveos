import 'package:flutter_riverpod/flutter_riverpod.dart';

final internalStorageProvider = StateProvider<int>((ref) {
  return 0;
});

final externalStorageProvider = StateProvider<int>((ref) {
  return 0;
});

final cacheSizeProvider = StateProvider<int>((ref) {
  return 0;
});
