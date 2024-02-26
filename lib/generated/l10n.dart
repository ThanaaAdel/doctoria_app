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

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account`
  String get text_sign_in {
    return Intl.message(
      'Login to your account',
      name: 'text_sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Sign up to your account`
  String get text_sign_up {
    return Intl.message(
      'Sign up to your account',
      name: 'text_sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forget_password {
    return Intl.message(
      'Forget Password',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get sign_up {
    return Intl.message(
      'Sign up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account ? `
  String get do_not_have_account {
    return Intl.message(
      'Don\'t have an account ? ',
      name: 'do_not_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Referral Code`
  String get referral_code {
    return Intl.message(
      'Referral Code',
      name: 'referral_code',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_button {
    return Intl.message(
      'Continue',
      name: 'continue_button',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Reset Via SMS`
  String get reset_via_sms {
    return Intl.message(
      'Reset Via SMS',
      name: 'reset_via_sms',
      desc: '',
      args: [],
    );
  }

  /// `Reset Via Whatsapp`
  String get reset_via_whatsapp {
    return Intl.message(
      'Reset Via Whatsapp',
      name: 'reset_via_whatsapp',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `Enter Verification Code`
  String get text_verification_Screen {
    return Intl.message(
      'Enter Verification Code',
      name: 'text_verification_Screen',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 4-digit that we have sent via the phone number .`
  String get description_text_verification_screen {
    return Intl.message(
      'Enter the 4-digit that we have sent via the phone number .',
      name: 'description_text_verification_screen',
      desc: '',
      args: [],
    );
  }

  /// `Change number`
  String get change_number {
    return Intl.message(
      'Change number',
      name: 'change_number',
      desc: '',
      args: [],
    );
  }

  /// `Create new password`
  String get create_new_password {
    return Intl.message(
      'Create new password',
      name: 'create_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Create Your New Password`
  String get text_create_new_password_page {
    return Intl.message(
      'Create Your New Password',
      name: 'text_create_new_password_page',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations!`
  String get congratulations {
    return Intl.message(
      'Congratulations!',
      name: 'congratulations',
      desc: '',
      args: [],
    );
  }

  /// `Your account is ready to use, you will be redirected to the Home page in a few Seconds...`
  String get text_congratulations {
    return Intl.message(
      'Your account is ready to use, you will be redirected to the Home page in a few Seconds...',
      name: 'text_congratulations',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get see_all {
    return Intl.message(
      'See All',
      name: 'see_all',
      desc: '',
      args: [],
    );
  }

  /// `General\nconsultation`
  String get general_consultation {
    return Intl.message(
      'General\nconsultation',
      name: 'general_consultation',
      desc: '',
      args: [],
    );
  }

  /// `Specialized\nconsultation`
  String get specialized_consultation {
    return Intl.message(
      'Specialized\nconsultation',
      name: 'specialized_consultation',
      desc: '',
      args: [],
    );
  }

  /// `medical\nBag`
  String get medical_bag {
    return Intl.message(
      'medical\nBag',
      name: 'medical_bag',
      desc: '',
      args: [],
    );
  }

  /// `Medical \nfile`
  String get medical_file {
    return Intl.message(
      'Medical \nfile',
      name: 'medical_file',
      desc: '',
      args: [],
    );
  }

  /// `Home \nCar`
  String get home_car {
    return Intl.message(
      'Home \nCar',
      name: 'home_car',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Popular Doctors`
  String get popular_doctors {
    return Intl.message(
      'Popular Doctors',
      name: 'popular_doctors',
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
