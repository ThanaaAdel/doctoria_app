// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Find a doctor`
  String get find_a_doctor {
    return Intl.message(
      'Find a doctor',
      name: 'find_a_doctor',
      desc: '',
      args: [],
    );
  }

  /// `Choose a Doctor`
  String get choose_a_doctor {
    return Intl.message(
      'Choose a Doctor',
      name: 'choose_a_doctor',
      desc: '',
      args: [],
    );
  }

  /// `Book Your date`
  String get book_your_date {
    return Intl.message(
      'Book Your date',
      name: 'book_your_date',
      desc: '',
      args: [],
    );
  }

  /// `You can search for a doctor by specialty and the location you are in`
  String get intro_screen1 {
    return Intl.message(
      'You can search for a doctor by specialty and the location you are in',
      name: 'intro_screen1',
      desc: '',
      args: [],
    );
  }

  /// `You can compare between doctors, according to the evaluation of other patients`
  String get intro_screen2 {
    return Intl.message(
      'You can compare between doctors, according to the evaluation of other patients',
      name: 'intro_screen2',
      desc: '',
      args: [],
    );
  }

  /// `After choosing the doctor that suits you, you can book your appointment online`
  String get intro_screen3 {
    return Intl.message(
      'After choosing the doctor that suits you, you can book your appointment online',
      name: 'intro_screen3',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get start_now {
    return Intl.message(
      'Start Now',
      name: 'start_now',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
