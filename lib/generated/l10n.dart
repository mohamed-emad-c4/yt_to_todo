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

  /// `All Playlists`
  String get all_Playlists {
    return Intl.message(
      'All Playlists',
      name: 'all_Playlists',
      desc: '',
      args: [],
    );
  }

  /// `All Videos`
  String get all_Videos {
    return Intl.message(
      'All Videos',
      name: 'all_Videos',
      desc: '',
      args: [],
    );
  }

  /// `Add Playlist`
  String get add_Playlist {
    return Intl.message(
      'Add Playlist',
      name: 'add_Playlist',
      desc: '',
      args: [],
    );
  }

  /// `Total Time`
  String get total_Time {
    return Intl.message(
      'Total Time',
      name: 'total_Time',
      desc: '',
      args: [],
    );
  }

  /// `Total Videos`
  String get total_Videos {
    return Intl.message(
      'Total Videos',
      name: 'total_Videos',
      desc: '',
      args: [],
    );
  }

  /// `Insert`
  String get insert {
    return Intl.message(
      'Insert',
      name: 'insert',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `View Playlist`
  String get view_Playlist {
    return Intl.message(
      'View Playlist',
      name: 'view_Playlist',
      desc: '',
      args: [],
    );
  }

  /// `View Playlist Roadmap`
  String get view_Playlist_Roadmap {
    return Intl.message(
      'View Playlist Roadmap',
      name: 'view_Playlist_Roadmap',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message(
      'Duration',
      name: 'duration',
      desc: '',
      args: [],
    );
  }

  /// `The Playlist Roadmap`
  String get the_Playlist_Roadmap {
    return Intl.message(
      'The Playlist Roadmap',
      name: 'the_Playlist_Roadmap',
      desc: '',
      args: [],
    );
  }

  /// `Video`
  String get video {
    return Intl.message(
      'Video',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `No playlists found`
  String get no_playlists_found {
    return Intl.message(
      'No playlists found',
      name: 'no_playlists_found',
      desc: '',
      args: [],
    );
  }

  /// `Enter any notes about the playlist`
  String get enter_any_notes_about_the_playlist {
    return Intl.message(
      'Enter any notes about the playlist',
      name: 'enter_any_notes_about_the_playlist',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Enter the URL of the playlist`
  String get enter_the_URL_of_the_playlist {
    return Intl.message(
      'Enter the URL of the playlist',
      name: 'enter_the_URL_of_the_playlist',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a URL`
  String get please_enter_a_URL {
    return Intl.message(
      'Please enter a URL',
      name: 'please_enter_a_URL',
      desc: '',
      args: [],
    );
  }

  /// `error`
  String get error {
    return Intl.message(
      'error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Invalid playlist URL`
  String get invalid_playlist_URL {
    return Intl.message(
      'Invalid playlist URL',
      name: 'invalid_playlist_URL',
      desc: '',
      args: [],
    );
  }

  /// `URL`
  String get url {
    return Intl.message(
      'URL',
      name: 'url',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid YouTube playlist URL`
  String get please_enter_a_valid_youtube_playlist_URL {
    return Intl.message(
      'Please enter a valid YouTube playlist URL',
      name: 'please_enter_a_valid_youtube_playlist_URL',
      desc: '',
      args: [],
    );
  }

  /// `Playlist URL`
  String get playlist_url {
    return Intl.message(
      'Playlist URL',
      name: 'playlist_url',
      desc: '',
      args: [],
    );
  }

  /// `Playlist Notes`
  String get playlist_notes {
    return Intl.message(
      'Playlist Notes',
      name: 'playlist_notes',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get something_went_wrong {
    return Intl.message(
      'Something went wrong',
      name: 'something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `All Days Roadmap`
  String get all_days_roadmap {
    return Intl.message(
      'All Days Roadmap',
      name: 'all_days_roadmap',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `No videos found`
  String get no_videos_found {
    return Intl.message(
      'No videos found',
      name: 'no_videos_found',
      desc: '',
      args: [],
    );
  }

  /// `Could not launch`
  String get could_not_launch {
    return Intl.message(
      'Could not launch',
      name: 'could_not_launch',
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
