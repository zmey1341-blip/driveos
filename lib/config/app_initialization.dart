import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../modules/varvara/services/varvara_service.dart';
import '../../modules/navigation/services/navigation_service.dart';
import '../../modules/music/services/music_service.dart';
import '../../modules/vehicle/services/vehicle_service.dart';
import '../../modules/obd/services/obd_service.dart';
import '../../modules/dashcam/services/dashcam_service.dart';
import '../../modules/connectivity/services/connection_manager.dart';
import '../../modules/storage/services/storage_manager.dart';
import '../../modules/security/services/security_manager.dart';
import '../../modules/notifications/services/notification_manager.dart';

// App Initialization Provider
final appInitializationProvider = FutureProvider((ref) async {
  // Initialize all services
  final logger = ref.watch(loggerServiceProvider);
  
  logger.info('Initializing app services...');
  
  try {
    // Initialize core services first
    await ref.watch(varvaraServiceProvider).then((service) => service.init());
    
    // Initialize feature services
    await ref.watch(navigationServiceProvider).then((service) => service.init());
    await ref.watch(musicServiceProvider).then((service) => service.init());
    await ref.watch(vehicleServiceProvider).then((service) => service.init());
    await ref.watch(obdServiceProvider).then((service) => service.init());
    await ref.watch(dashCamServiceProvider).then((service) => service.init());
    await ref.watch(connectionManagerProvider).then((service) => service.init());
    await ref.watch(storageManagerProvider).then((service) => service.init());
    await ref.watch(securityManagerProvider).then((service) => service.init());
    await ref.watch(notificationManagerProvider).then((service) => service.init());
    
    logger.info('All services initialized successfully');
    return true;
  } catch (e, stackTrace) {
    logger.error('Failed to initialize services', e, stackTrace);
    return false;
  }
});

final loggerServiceProvider = Provider((ref) {
  // This will be provided by GetIt from service_locator
  throw UnimplementedError();
});
