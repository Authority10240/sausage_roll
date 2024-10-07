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

  /// `An error has occured`
  String get anErrorHasOccured {
    return Intl.message(
      'An error has occured',
      name: 'anErrorHasOccured',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Sausage Roll House`
  String get welcomeToSausageRollHouse {
    return Intl.message(
      'Welcome to Sausage Roll House',
      name: 'welcomeToSausageRollHouse',
      desc: '',
      args: [],
    );
  }

  /// `Here is our latest Sausage Roll`
  String get hereIsOurLatestSousageRoll {
    return Intl.message(
      'Here is our latest Sausage Roll',
      name: 'hereIsOurLatestSousageRoll',
      desc: '',
      args: [],
    );
  }

  /// `What we call it:`
  String get whatWeCallIt {
    return Intl.message(
      'What we call it:',
      name: 'whatWeCallIt',
      desc: '',
      args: [],
    );
  }

  /// `What our customers call it:`
  String get whatOurCustomersCallIt {
    return Intl.message(
      'What our customers call it:',
      name: 'whatOurCustomersCallIt',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get addToCArt {
    return Intl.message(
      'Add to cart',
      name: 'addToCArt',
      desc: '',
      args: [],
    );
  }

  /// `When you can have one:`
  String get whenYouCanHaveOne {
    return Intl.message(
      'When you can have one:',
      name: 'whenYouCanHaveOne',
      desc: '',
      args: [],
    );
  }

  /// `Offer available:`
  String get offerAvailable {
    return Intl.message(
      'Offer available:',
      name: 'offerAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Eat in:`
  String get eatIn {
    return Intl.message(
      'Eat in:',
      name: 'eatIn',
      desc: '',
      args: [],
    );
  }

  /// `Eat out:`
  String get eatOut {
    return Intl.message(
      'Eat out:',
      name: 'eatOut',
      desc: '',
      args: [],
    );
  }

  /// `On our menu today:`
  String get onOurMenuToday {
    return Intl.message(
      'On our menu today:',
      name: 'onOurMenuToday',
      desc: '',
      args: [],
    );
  }

  /// `From:`
  String get from {
    return Intl.message(
      'From:',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To:`
  String get To {
    return Intl.message(
      'To:',
      name: 'To',
      desc: '',
      args: [],
    );
  }

  /// `Item added`
  String get itemAdded {
    return Intl.message(
      'Item added',
      name: 'itemAdded',
      desc: '',
      args: [],
    );
  }

  /// `Item added successfully`
  String get itemAddedSuccessfully {
    return Intl.message(
      'Item added successfully',
      name: 'itemAddedSuccessfully',
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
