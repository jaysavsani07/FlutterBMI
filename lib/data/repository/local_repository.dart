import 'package:bmi_calculator/data/sharedpref/preferences.dart';
import 'package:bmi_calculator/data/sharedpref/shared_preference_helper.dart';

class LocalRepository {
  final SharedPreferencesHelper preferencesHelper;

  LocalRepository({
    required this.preferencesHelper,
  });

  Future<bool> saveIsFirstTime() {
    return preferencesHelper.putBool(Preferences.isFirstTime, false);
  }

  Future<bool> rated() {
    return preferencesHelper.putBool(Preferences.rated, true);
  }

  Future<bool> remindMeLater() {
    return preferencesHelper.putBool(Preferences.remindMeLater, true);
  }

  bool isRemindOrRated() {
    return preferencesHelper.getBool(Preferences.remindMeLater,
            defValue: false) ||
        preferencesHelper.getBool(Preferences.rated, defValue: false);
  }

  bool getFirstTime() {
    return preferencesHelper.getBool(Preferences.isFirstTime, defValue: true);
  }

  int getAppOpenCount() {
    return preferencesHelper.getInt(Preferences.appOpenCount, defValue: 0);
  }

  Future<bool> increaseAppOpenCount() {
    return preferencesHelper.putInt(
        Preferences.appOpenCount, getAppOpenCount() + 1);
  }

  Future<bool> setFirstTimeDate() {
    return preferencesHelper.putInt(
        Preferences.firstTimeDate, DateTime.now().millisecondsSinceEpoch);
  }

  DateTime getFirstTimeDate() {
    int dateTime = preferencesHelper.getInt(Preferences.firstTimeDate);
    if (dateTime == -1) {
      return DateTime.now();
    } else {
      return DateTime.fromMillisecondsSinceEpoch(dateTime);
    }
  }
}
