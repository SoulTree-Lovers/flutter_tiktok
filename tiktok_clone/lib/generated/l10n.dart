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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign Up for {nameOfTheApp} {when}`
  String signUpTitle(String nameOfTheApp, DateTime when) {
    final DateFormat whenDateFormat = DateFormat(
      'yQQQQ / LLLL : Hm',
      Intl.getCurrentLocale(),
    );
    final String whenString = whenDateFormat.format(when);

    return Intl.message(
      'Sign Up for $nameOfTheApp $whenString',
      name: 'signUpTitle',
      desc: 'Title for the sign up page',
      args: [nameOfTheApp, whenString],
    );
  }

  /// `Log into your {nameOfTheApp} account`
  String loginTitle(String nameOfTheApp) {
    return Intl.message(
      'Log into your $nameOfTheApp account',
      name: 'loginTitle',
      desc: 'Title for the login page',
      args: [nameOfTheApp],
    );
  }

  /// `Create a profile, follow other accounts, make your own {videoCount, plural, =0{no videos} =1{1 video} other{# videos}} and more!`
  String signUpSubtitle(num videoCount) {
    return Intl.message(
      'Create a profile, follow other accounts, make your own ${Intl.plural(videoCount, zero: 'no videos', one: '1 video', other: '# videos')} and more!',
      name: 'signUpSubtitle',
      desc: '',
      args: [videoCount],
    );
  }

  /// `Log In {gender, select, male{sir} female{madam} other{human}}`
  String logIn(String gender) {
    return Intl.message(
      'Log In ${Intl.gender(gender, male: 'sir', female: 'madam', other: 'human')}',
      name: 'logIn',
      desc: '',
      args: [gender],
    );
  }

  /// `{potato}`
  String likeCount(int potato) {
    final NumberFormat potatoNumberFormat = NumberFormat.compact(
      locale: Intl.getCurrentLocale(),
    );
    final String potatoString = potatoNumberFormat.format(potato);

    return Intl.message(
      '$potatoString',
      name: 'likeCount',
      desc: 'The number of likes on a post',
      args: [potatoString],
    );
  }

  /// `{potato}`
  String commentCount(int potato) {
    final NumberFormat potatoNumberFormat = NumberFormat.compact(
      locale: Intl.getCurrentLocale(),
    );
    final String potatoString = potatoNumberFormat.format(potato);

    return Intl.message(
      '$potatoString',
      name: 'commentCount',
      desc: 'The number of likes on a post',
      args: [potatoString],
    );
  }

  /// `{value} comments`
  String commentTitle(int value) {
    final NumberFormat valueNumberFormat = NumberFormat.compact(
      locale: Intl.getCurrentLocale(),
    );
    final String valueString = valueNumberFormat.format(value);

    return Intl.message(
      '$valueString comments',
      name: 'commentTitle',
      desc: 'The number of comments on a post',
      args: [valueString],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ko'),
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
