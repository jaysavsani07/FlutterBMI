import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsRepository {
  final FirebaseAnalytics firebaseAnalytics;

  AnalyticsRepository({
    required this.firebaseAnalytics,
  });

  Future<void> setEnvironment(String type) {
    return firebaseAnalytics.setDefaultEventParameters({"environment": type});
  }

  Future<void> logShareClick() {
    return firebaseAnalytics.logEvent(name: "share_click");
  }

  Future<void> logRateUsClick() {
    return firebaseAnalytics.logEvent(name: "rate_us_click");
  }

  Future<void> logRateUsDialogShow() {
    return firebaseAnalytics.logEvent(name: "rate_us_dialog_show");
  }

  Future<void> logRateUsRated() {
    return firebaseAnalytics.logEvent(name: "rate_us_rated");
  }

  Future<void> logRateUsLater() {
    return firebaseAnalytics.logEvent(name: "rate_us_later");
  }
}
