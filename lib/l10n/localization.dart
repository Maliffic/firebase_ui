import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'translations.dart';

class FFULocalizations {
  TranslationBundle _translationBundle;

  FFULocalizations(Locale locale) {
    _translationBundle = translationBundleForLocale(locale);
  }

  String get welcome => _translationBundle.welcome;

  String get signUpTitle => _translationBundle.signUpTitle;

  String get emailLabel => _translationBundle.emailLabel;

  String get nextButtonLabel => _translationBundle.nextButtonLabel;

  String get cancelButtonLabel => _translationBundle.cancelButtonLabel;

  String get passwordLabel => _translationBundle.passwordLabel;
  String get passwordCheckLabel => _translationBundle.passwordCheckLabel;
  String get passwordCheckError => _translationBundle.passwordCheckError;

  String get troubleSigningInLabel => _translationBundle.troubleSigningInLabel;

  String get signInLabel => _translationBundle.signInLabel;

  String get signInTitle => _translationBundle.signInTitle;

  String get passwordInvalidMessage =>
      _translationBundle.passwordInvalidMessage;

  String get recoverPasswordTitle => _translationBundle.recoverPasswordTitle;

  String get recoverHelpLabel => _translationBundle.recoverHelpLabel;

  String get sendButtonLabel => _translationBundle.sendButtonLabel;

  String get nameLabel => _translationBundle.nameLabel;

  String get saveLabel => _translationBundle.saveLabel;

  String get passwordLengthMessage => _translationBundle.passwordLengthMessage;

  String get signInFacebook => _translationBundle.signInFacebook;
  String get signInGoogle => _translationBundle.signInGoogle;
  String get signInEmail => _translationBundle.signInEmail;
  String get signInTwitter => _translationBundle.signInTwitter;

  String get errorOccurred => _translationBundle.errorOccurred;

  static Future<FFULocalizations> load(Locale locale) {
    return new SynchronousFuture<FFULocalizations>(
        new FFULocalizations(locale));
  }

  static FFULocalizations of(BuildContext context) {
    return Localizations.of<FFULocalizations>(context, FFULocalizations) ??
        new _DefaultFFULocalizations();
  }

  static const LocalizationsDelegate<FFULocalizations> delegate =
      const _FFULocalizationsDelegate();

  String allReadyEmailMessage(String email, String providerName) =>
      _translationBundle.allReadyEmailMessage(email, providerName);

  String recoverDialog(String email) => _translationBundle.recoverDialog(email);
}

class _DefaultFFULocalizations extends FFULocalizations {
  _DefaultFFULocalizations() : super(const Locale('en', 'US'));
}

class _FFULocalizationsDelegate
    extends LocalizationsDelegate<FFULocalizations> {
  const _FFULocalizationsDelegate();

  static const List<String> _supportedLanguages = const <String>[
    'en', // English
    'fr', // French
    'de', // Deutsch
    'pt', // Portuguese
    'es', // Spanish
  ];

  @override
  bool isSupported(Locale locale) =>
      _supportedLanguages.contains(locale.languageCode);

  @override
  Future<FFULocalizations> load(Locale locale) => FFULocalizations.load(locale);

  @override
  bool shouldReload(_FFULocalizationsDelegate old) => false;
}
