
import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale get locale {
    //print("app_mobile_language.isEmpty${app_mobile_language.$.isEmpty}");
    return
        // Locale(
        //     app_mobile_language.$ == '' ? "vi" : app_mobile_language.$!, '');
        Locale('vi');
  }

  void setLocale(String code) {
    notifyListeners();
  }
  // Locale? _locale;
  // Language? language;
  // Locale get locale {
  //   if (_prefs == null) {
  //     return _locale = Locale(AppConfig.defaultLanguage, '');
  //   }
  //   String savedLanguage =
  //       _prefs!.getString('app_language') ?? AppConfig.defaultLanguage;

  //   return _locale = Locale(savedLanguage, '');
  // }

  // SharedPreferences? _prefs;

  // LocaleProvider() {
  //   _loadPrefs();
  // }
  // void _loadPrefs() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   notifyListeners();
  // }

  // Future<void> setLocale(String code) async {
  //   await _prefs!.setString('app_language', code);
  //   _locale = Locale(code, '');
  //   notifyListeners();
  // }

  // List<Language> listLanguage = [
  //   Language(
  //       id: "01",
  //       code: "en",
  //       name: "English",
  //       image: "assets/images/UK_flag.png"),
  //   Language(
  //       id: "02",
  //       code: "vi",
  //       name: "Vietnamese",
  //       image: "assets/images/vietnam_flag.png")
  // ];
}
