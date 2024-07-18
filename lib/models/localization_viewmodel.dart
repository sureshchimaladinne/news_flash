import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationViewModel extends ChangeNotifier {
  Locale _locale = Locale('en', 'US');

  Locale get locale => _locale;

  LocalizationViewModel() {
    _loadLocale();
  }

  void changeLocale(String languageCode) async {
    Locale newLocale = Locale(languageCode);
    _locale = newLocale;
    Get.updateLocale(newLocale);
    notifyListeners();
    _saveLocale(languageCode);
  }

  void _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('locale') ?? 'en';
    _locale = Locale(languageCode);
    Get.updateLocale(_locale);
    notifyListeners();
  }

  void _saveLocale(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', languageCode);
  }
}
