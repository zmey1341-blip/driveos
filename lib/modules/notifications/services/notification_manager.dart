import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/logger/logger_service.dart';
import '../../../core/di/service_locator.dart';

class NotificationManager {
  final LoggerService _logger = getIt<LoggerService>();
  
  List<String> _notifications = [];

  Future<void> init() async {
    try {
      _logger.info('Notification manager initialized');
    } catch (e) {
      _logger.error('Failed to initialize notification manager', e);
    }
  }

  Future<void> sendNotification(String title, String message) async {
    try {
      _notifications.add('$title: $message');
      _logger.info('Notification sent: $title');
    } catch (e) {
      _logger.error('Failed to send notification', e);
    }
  }

  List<String> get notifications => _notifications;
}

final notificationManagerProvider = Provider((ref) => NotificationManager());
