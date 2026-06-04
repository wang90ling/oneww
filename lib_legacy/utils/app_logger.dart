import 'dart:developer' as developer;

class AppLogger {
  static void info(String message, {String tag = 'APP'}) {
    developer.log(message, name: tag);
  }

  static void error(String message, {Object? error, StackTrace? stackTrace, String tag = 'APP'}) {
    developer.log(
      message,
      name: tag,
      error: error,
      stackTrace: stackTrace,
      level: 1000,
    );
  }
}
