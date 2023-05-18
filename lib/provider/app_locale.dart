// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocale extends ChangeNotifier {

  Locale _locale = Locale('en');
  Locale get locale => _locale;

  SharedPreferences? _sharedPreferences;

  // constructor
  AppLocale(Locale locale) {
    _locale = locale;
  }

  void changeLocale(Locale newLocale) async {

    _sharedPreferences = await SharedPreferences.getInstance();
    await _sharedPreferences!.setString('languageCode', newLocale.languageCode);

    _locale = newLocale;
    notifyListeners();
  }
  
}