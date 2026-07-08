import 'package:get_it/get_it.dart';
import '../logger/logger_service.dart';
import '../storage/storage_service.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Logger
  getIt.registerSingleton<LoggerService>(LoggerService());

  // Storage
  final storageService = StorageService();
  await storageService.init();
  getIt.registerSingleton<StorageService>(storageService);
}
