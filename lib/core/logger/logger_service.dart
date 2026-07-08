enum LogLevel {
  verbose,
  debug,
  info,
  warning,
  error,
  fatal,
}

class LoggerService {
  final List<String> _logs = [];
  final int _maxLogs = 1000;

  void log(
    String message, {
    LogLevel level = LogLevel.info,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    final timestamp = DateTime.now().toIso8601String();
    final logMessage = '[$timestamp] [${level.name.toUpperCase()}] $message';
    
    if (error != null) {
      print('$logMessage\nError: $error');
      if (stackTrace != null) {
        print(stackTrace);
      }
    } else {
      print(logMessage);
    }

    _logs.add(logMessage);
    if (_logs.length > _maxLogs) {
      _logs.removeAt(0);
    }
  }

  void verbose(String message) => log(message, level: LogLevel.verbose);
  void debug(String message) => log(message, level: LogLevel.debug);
  void info(String message) => log(message, level: LogLevel.info);
  void warning(String message) => log(message, level: LogLevel.warning);
  void error(String message, [dynamic error, StackTrace? stackTrace]) =>
      log(message, level: LogLevel.error, error: error, stackTrace: stackTrace);
  void fatal(String message, [dynamic error, StackTrace? stackTrace]) =>
      log(message, level: LogLevel.fatal, error: error, stackTrace: stackTrace);

  List<String> get logs => _logs;
  void clearLogs() => _logs.clear();
}
