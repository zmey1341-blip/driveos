import 'package:flutter_riverpod/flutter_riverpod.dart';

final isAuthenticatedProvider = StateProvider<bool>((ref) {
  return false;
});

final isAuthenticatingProvider = StateProvider<bool>((ref) {
  return false;
});
