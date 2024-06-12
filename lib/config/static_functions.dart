// Dependencies
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Global function to clear shared preferences
clearStorage() async {
  await Hive.box('SIFR_THEME_CONTROLS').clear();

  await Hive.box('SIFR_USER_CONTROLS').clear();
  final SharedPreferences pref = await SharedPreferences.getInstance();
  pref.clear();
}
