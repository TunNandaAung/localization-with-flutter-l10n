import 'package:flutter/material.dart';

enum AppLocale { en, es, my }

final appLocaleData = {
  AppLocale.en: const Locale('en', 'US'),
  AppLocale.es: const Locale('es', 'ES'),
  AppLocale.my: const Locale('my', 'MM')
};
