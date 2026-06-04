import 'dart:developer' as developer;

/**
 * 日志帮助类
 */
class AppLogger {
  static void info(String message, {String tag = 'APP'}) {
    final logMessage = '[${DateTime.now().toIso8601String()}] [$tag] INFO: $message';
    print(logMessage);
    developer.log(message, name: tag);
  }

  static void error(String message, {Object? error, StackTrace? stackTrace, String tag = 'APP'}) {
    final errorMessage = error?.toString() ?? '';
    final logMessage = '[${DateTime.now().toIso8601String()}] [$tag] ERROR: $message $errorMessage';
    print(logMessage);
    if (stackTrace != null) {
      print(stackTrace.toString());
    }
    developer.log(
      message,
      name: tag,
      error: error,
      stackTrace: stackTrace,
      level: 1000,
    );
  }

  static void debug(String message, {String tag = 'APP'}) {
    final logMessage = '[${DateTime.now().toIso8601String()}] [$tag] DEBUG: $message';
    print(logMessage);
    developer.log(message, name: tag, level: 800);
  }
}
