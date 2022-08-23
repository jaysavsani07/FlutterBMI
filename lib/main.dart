import 'dart:async';
import 'dart:isolate';

import 'package:bmi_calculator/data/repository/analytics_repository.dart';
import 'package:bmi_calculator/data/sharedpref/shared_preference_helper.dart';
import 'package:bmi_calculator/firebase_options.dart';
import 'package:bmi_calculator/view/app/app_view.dart';
import 'package:bmi_calculator/view/app/theme_provider.dart';
import 'package:bmi_calculator/view/dashboard/bmi_provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/constants.dart';
import 'data/repository/local_repository.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;
    getAppVersionName();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    // Errors outside of Flutter
    Isolate.current.addErrorListener(RawReceivePort((List<dynamic> pair) async {
      final List<dynamic> errorAndStacktrace = pair;
      await FirebaseCrashlytics.instance.recordError(
        errorAndStacktrace.first,
        errorAndStacktrace.last as StackTrace,
      );
    }).sendPort);

    runApp(
      Provider(
        create: (context) => SharedPreferencesHelper(sharedPreferences),
        child: Provider(
          create: (context) => LocalRepository(
              preferencesHelper: context.read<SharedPreferencesHelper>()),
          child: Provider(
            create: (context) =>
                AnalyticsRepository(firebaseAnalytics: firebaseAnalytics),
            child: ChangeNotifierProvider(
              create: (context) => BmiProvider(
                  sharedPreferencesHelper:
                      context.read<SharedPreferencesHelper>()),
              child: ChangeNotifierProvider(
                create: (context) => ThemeProvider(
                    sharedPreferencesHelper:
                        context.read<SharedPreferencesHelper>()),
                child: MyApp(
                  firebaseAnalytics: firebaseAnalytics,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

void getAppVersionName() async {
  try {
    PackageInfo info = await PackageInfo.fromPlatform();
    platformVersion = info.version;
  } on PlatformException {
    platformVersion = 'Failed to get platform version.';
  }
}
