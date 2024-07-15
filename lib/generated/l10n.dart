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

  /// `Add a comment`
  String get add_comment {
    return Intl.message(
      'Add a comment',
      name: 'add_comment',
      desc: '',
      args: [],
    );
  }

  /// `AutoModerator`
  String get auto_moderator {
    return Intl.message(
      'AutoModerator',
      name: 'auto_moderator',
      desc: '',
      args: [],
    );
  }

  /// `MOD`
  String get mod {
    return Intl.message(
      'MOD',
      name: 'mod',
      desc: '',
      args: [],
    );
  }

  /// `points`
  String get points {
    return Intl.message(
      'points',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `BEST COMMENTS`
  String get best_comments {
    return Intl.message(
      'BEST COMMENTS',
      name: 'best_comments',
      desc: '',
      args: [],
    );
  }

  /// `Promoted`
  String get promoted {
    return Intl.message(
      'Promoted',
      name: 'promoted',
      desc: '',
      args: [],
    );
  }

  /// `Learn More`
  String get learn_more {
    return Intl.message(
      'Learn More',
      name: 'learn_more',
      desc: '',
      args: [],
    );
  }

  /// `Reply`
  String get reply {
    return Intl.message(
      'Reply',
      name: 'reply',
      desc: '',
      args: [],
    );
  }

  /// `Replys`
  String get replys {
    return Intl.message(
      'Replys',
      name: 'replys',
      desc: '',
      args: [],
    );
  }

  /// `OP`
  String get op {
    return Intl.message(
      'OP',
      name: 'op',
      desc: '',
      args: [],
    );
  }

  /// `more`
  String get more {
    return Intl.message(
      'more',
      name: 'more',
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
