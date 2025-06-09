import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:nodelabs_case/core/services/logger/logger_service.dart';

class FirebaseLogger implements LoggerService {
  @override
  void debug(String message) {}

  @override
  void info(String message) {
    FirebaseCrashlytics.instance.log('[INFO] $message');
  }

  @override
  void warning(String message) {
    FirebaseCrashlytics.instance.log('[WARNING] $message');
  }

  @override
  void error(String message, [dynamic error, StackTrace? stackTrace]) {
    FirebaseCrashlytics.instance.recordError(
      error ?? Exception(message),
      stackTrace,
      reason: message,
    );
  }
}
