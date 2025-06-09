import 'dart:developer';
import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsManager {
  static void setEventlog(String event, Map<String, Object>? eventParams) {
    try {
      Map<String, Object>? parameters = {"platform": Platform.isIOS ? "ios" : "android"};
      if (eventParams != null) {
        parameters.addAll(eventParams);
      }
      FirebaseAnalytics.instance.logEvent(name: event, parameters: parameters);
      log("event log : $event, $parameters");
    } catch (_) {}
  }
}
