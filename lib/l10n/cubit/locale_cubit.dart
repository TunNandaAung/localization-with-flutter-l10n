import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:l10n_with_flutter_l10n/l10n/app_locale.dart';
import 'package:l10n_with_flutter_l10n/l10n/l10n.dart';
import 'package:l10n_with_flutter_l10n/preferences/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit()
      : super(
          AppLocalizations.supportedLocales
              .where((e) => e.languageCode == Prefer.localePref)
              .first,
        );

  Future<void> changeLocale(
    AppLocale appLocale,
  ) async {
    final locale = appLocaleData[appLocale]!;
    emit(locale);

    Prefer.prefs = await SharedPreferences.getInstance();
    await Prefer.prefs!.setString('locale', locale.languageCode);
    Prefer.localePref = locale.languageCode;

    await AppLocalizations.delegate.load(locale);
  }
}
