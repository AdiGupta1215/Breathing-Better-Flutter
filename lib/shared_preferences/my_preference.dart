import 'package:shared_preferences/shared_preferences.dart';

class MyPreference {
  static String customInhaleDuration = 'customInhaleDuration';
  static String customHoldDuration = 'customHoldDuration';
  static String customExhaleDuration = 'customExhaleDuration';
  static String numberOfCycle = 'numberOfCycle';
  static late SharedPreferences sharedPreferences;
// Write DATA inhaleDuration
  static void saveInhale(int value) async {
    sharedPreferences.setInt(customInhaleDuration, value);
  }

// Read Data inhaleDuration
  static int? getInhale() {
    return sharedPreferences.getInt(customInhaleDuration);
  }

  // Write DATA holdDuration
  static void saveHold(int value) async {
    sharedPreferences.setInt(customHoldDuration, value);
  }

// Read Data holdDuration
  static int? getHold() {
    return sharedPreferences.getInt(customHoldDuration);
  }

  // Write DATA exhaleDuration
  static void saveExhale(int value) async {
    sharedPreferences.setInt(customExhaleDuration, value);
  }

// Read Data exhaleDuration
  static int? getExhale() {
    return sharedPreferences.getInt(customExhaleDuration);
  }

  // Write DATA number of cycle
  static void saveNoOfCycle(int value) async {
    sharedPreferences.setInt(numberOfCycle, value);
  }

// Read Data number of cycle
  static int? getNoOfCycle() {
    return sharedPreferences.getInt(numberOfCycle);
  }
}
