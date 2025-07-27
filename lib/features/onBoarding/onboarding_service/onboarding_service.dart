import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {
  static late SharedPreferences sharedprefs;
  static Future initializeSharedPrefrencesStorage() async {
    sharedprefs = await SharedPreferences.getInstance();
  }

  static bool isFirstTime() {
    return sharedprefs.getBool("isFirstTime") ?? true;
  }

  static setFirstTimeWithFalse() async {
    await sharedprefs.setBool("isFirstTime", false);
  }
}
