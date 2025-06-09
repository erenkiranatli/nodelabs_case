import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:nodelabs_case/core/services/logger/logger_service.dart';

class ConsoleLogger implements LoggerService {
  @override
  void debug(String message) {
    if (kDebugMode) {
      log('[DEBUG] $message');
    }
  }

  @override
  void info(String message) {
    log(
      '[INFO] $message',
    );
  }

  @override
  void warning(String message) {
    log('[WARNING] $message');
  }

  @override
  void error(String message, [dynamic error, StackTrace? stackTrace]) {
    log('[ERROR] $message');
    if (error != null) debugPrint('Error: $error');
    if (stackTrace != null) debugPrint('StackTrace: $stackTrace');
  }
}
