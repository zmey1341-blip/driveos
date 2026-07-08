import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatDateTime(DateTime dateTime, {String format = 'dd.MM.yyyy HH:mm'}) {
    return DateFormat(format, 'ru_RU').format(dateTime);
  }

  static String formatDate(DateTime dateTime, {String format = 'dd.MM.yyyy'}) {
    return DateFormat(format, 'ru_RU').format(dateTime);
  }

  static String formatTime(DateTime dateTime, {String format = 'HH:mm'}) {
    return DateFormat(format, 'ru_RU').format(dateTime);
  }

  static String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    
    if (hours > 0) {
      return '${hours}ч ${minutes}м';
    } else if (minutes > 0) {
      return '${minutes}м ${seconds}с';
    } else {
      return '${seconds}с';
    }
  }
}
