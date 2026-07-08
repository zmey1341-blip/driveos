import 'package:get_it/get_it.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../storage/storage_service.dart';
import '../connectivity/connectivity_service.dart';
import '../logger/logger_service.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Core Services
  getIt.registerSingleton<LoggerService>(LoggerService());
  
  final storageService = StorageService();
  await storageService.init();
  getIt.registerSingleton<StorageService>(storageService);
  
  final connectivityService = ConnectivityService();
  await connectivityService.init();
  getIt.registerSingleton<ConnectivityService>(connectivityService);
}
