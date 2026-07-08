import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import '../models/navigation_models.dart';
import '../../../core/logger/logger_service.dart';
import '../../../core/di/service_locator.dart';

class NavigationService {
  final LoggerService _logger = getIt<LoggerService>();
  NavigationProvider _selectedProvider = NavigationProvider.googleMaps;
  NavigationRoute? _currentRoute;
  bool _isNavigating = false;

  Future<void> init() async {
    try {
      final hasLocationPermission = await _checkLocationPermission();
      if (!hasLocationPermission) {
        await Geolocator.requestLocationPermission();
      }
      _logger.info('Navigation service initialized');
    } catch (e) {
      _logger.error('Failed to initialize navigation', e);
    }
  }

  Future<bool> _checkLocationPermission() async {
    final permission = await Geolocator.checkPermission();
    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  Future<Position?> getCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
    } catch (e) {
      _logger.error('Failed to get current location', e);
      return null;
    }
  }

  Future<void> startNavigation(NavigationRoute route) async {
    try {
      _currentRoute = route;
      _isNavigating = true;
      _logger.info('Navigation started: ${route.name}');
    } catch (e) {
      _logger.error('Failed to start navigation', e);
    }
  }

  Future<void> stopNavigation() async {
    try {
      _isNavigating = false;
      _currentRoute = null;
      _logger.info('Navigation stopped');
    } catch (e) {
      _logger.error('Failed to stop navigation', e);
    }
  }

  void setProvider(NavigationProvider provider) {
    _selectedProvider = provider;
    _logger.info('Navigation provider changed to: ${provider.toString()}');
  }

  NavigationProvider get selectedProvider => _selectedProvider;
  NavigationRoute? get currentRoute => _currentRoute;
  bool get isNavigating => _isNavigating;
}

final navigationServiceProvider = Provider((ref) => NavigationService());
