import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/logger/logger_service.dart';
import '../../../core/di/service_locator.dart';

class StorageManager {
  final LoggerService _logger = getIt<LoggerService>();
  
  int _internalStorageUsed = 0;
  int _externalStorageUsed = 0;
  int _cacheSize = 0;

  Future<void> init() async {
    try {
      _logger.info('Storage manager initialized');
    } catch (e) {
      _logger.error('Failed to initialize storage manager', e);
    }
  }

  Future<void> clearCache() async {
    try {
      _cacheSize = 0;
      _logger.info('Cache cleared');
    } catch (e) {
      _logger.error('Failed to clear cache', e);
    }
  }

  int get internalStorageUsed => _internalStorageUsed;
  int get externalStorageUsed => _externalStorageUsed;
  int get cacheSize => _cacheSize;
}

final storageManagerProvider = Provider((ref) => StorageManager());
