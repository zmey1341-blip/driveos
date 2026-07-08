import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/navigation_models.dart';

final selectedNavigationProviderProvider = StateProvider<NavigationProvider>((ref) {
  return NavigationProvider.googleMaps;
});

final currentRouteProvider = StateProvider<NavigationRoute?>((ref) {
  return null;
});

final isNavigatingProvider = StateProvider<bool>((ref) {
  return false;
});

final favoriteRoutesProvider = FutureProvider((ref) async {
  return <NavigationRoute>[];
});
