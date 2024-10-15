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

  /// `Time`
  String get total_Time {
    return Intl.message(
      'Time',
      name: 'total_Time',
      desc: '',
      args: [],
    );
  }

  /// `Videos`
  String get total_Videos {
    return Intl.message(
      'Videos',
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

  /// `Notes `
  String get Notes {
    return Intl.message(
      'Notes ',
      name: 'Notes',
      desc: '',
      args: [],
    );
  }

  /// `Recorder`
  String get Recorder {
    return Intl.message(
      'Recorder',
      name: 'Recorder',
      desc: '',
      args: [],
    );
  }

  /// `Deleted`
  String get Deleted {
    return Intl.message(
      'Deleted',
      name: 'Deleted',
      desc: '',
      args: [],
    );
  }

  /// `Premanent Delete`
  String get Deletedf {
    return Intl.message(
      'Premanent Delete',
      name: 'Deletedf',
      desc: '',
      args: [],
    );
  }

  /// `Archived`
  String get Archived {
    return Intl.message(
      'Archived',
      name: 'Archived',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get Favorites {
    return Intl.message(
      'Favorites',
      name: 'Favorites',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Add Note`
  String get AddNote {
    return Intl.message(
      'Add Note',
      name: 'AddNote',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get LableTittleAdd {
    return Intl.message(
      'Title',
      name: 'LableTittleAdd',
      desc: '',
      args: [],
    );
  }

  /// `Content`
  String get LableContentAdd {
    return Intl.message(
      'Content',
      name: 'LableContentAdd',
      desc: '',
      args: [],
    );
  }

  /// `Edit Note`
  String get EditNote {
    return Intl.message(
      'Edit Note',
      name: 'EditNote',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get Done {
    return Intl.message(
      'Done',
      name: 'Done',
      desc: '',
      args: [],
    );
  }

  /// `Added to archive`
  String get AddedToArchive {
    return Intl.message(
      'Added to archive',
      name: 'AddedToArchive',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get Error {
    return Intl.message(
      'Error',
      name: 'Error',
      desc: '',
      args: [],
    );
  }

  /// `Failed to add note`
  String get FailedToAddNote {
    return Intl.message(
      'Failed to add note',
      name: 'FailedToAddNote',
      desc: '',
      args: [],
    );
  }

  /// `Failed to delete note`
  String get FailedToDeleteNote {
    return Intl.message(
      'Failed to delete note',
      name: 'FailedToDeleteNote',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get AboutUs {
    return Intl.message(
      'About Us',
      name: 'AboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to our app! We are dedicated to providing you with the best service and experience. Our team is committed to continuous improvement and innovation to meet your needs.`
  String get WelcomeMessage {
    return Intl.message(
      'Welcome to our app! We are dedicated to providing you with the best service and experience. Our team is committed to continuous improvement and innovation to meet your needs.',
      name: 'WelcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Our mission is to deliver high-quality solutions that improve your daily life and provide a seamless user experience.`
  String get OurMission {
    return Intl.message(
      'Our mission is to deliver high-quality solutions that improve your daily life and provide a seamless user experience.',
      name: 'OurMission',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get ContactUs {
    return Intl.message(
      'Contact Us',
      name: 'ContactUs',
      desc: '',
      args: [],
    );
  }

  /// `If you have any questions, feedback, or just want to get in touch, feel free to contact us.`
  String get QuestionsFeedback {
    return Intl.message(
      'If you have any questions, feedback, or just want to get in touch, feel free to contact us.',
      name: 'QuestionsFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Email Us`
  String get EmailUs {
    return Intl.message(
      'Email Us',
      name: 'EmailUs',
      desc: '',
      args: [],
    );
  }

  /// `Follow us on social media:`
  String get FollowUs {
    return Intl.message(
      'Follow us on social media:',
      name: 'FollowUs',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get Facebook {
    return Intl.message(
      'Facebook',
      name: 'Facebook',
      desc: '',
      args: [],
    );
  }

  /// `Twitter`
  String get Twitter {
    return Intl.message(
      'Twitter',
      name: 'Twitter',
      desc: '',
      args: [],
    );
  }

  /// `Instagram`
  String get Instagram {
    return Intl.message(
      'Instagram',
      name: 'Instagram',
      desc: '',
      args: [],
    );
  }

  /// `Could not launch`
  String get CouldNotLaunch {
    return Intl.message(
      'Could not launch',
      name: 'CouldNotLaunch',
      desc: '',
      args: [],
    );
  }

  /// `Help & Support`
  String get HelpSupport {
    return Intl.message(
      'Help & Support',
      name: 'HelpSupport',
      desc: '',
      args: [],
    );
  }

  /// `We are here to help! Whether you have a question, encounter an issue, or need further assistance, our support team is ready to assist you.`
  String get WeAreHereToHelp {
    return Intl.message(
      'We are here to help! Whether you have a question, encounter an issue, or need further assistance, our support team is ready to assist you.',
      name: 'WeAreHereToHelp',
      desc: '',
      args: [],
    );
  }

  /// `Frequently Asked Questions:`
  String get FAQ {
    return Intl.message(
      'Frequently Asked Questions:',
      name: 'FAQ',
      desc: '',
      args: [],
    );
  }

  /// `How can I reset my password?`
  String get ResetPassword {
    return Intl.message(
      'How can I reset my password?',
      name: 'ResetPassword',
      desc: '',
      args: [],
    );
  }

  /// `How to change my email address?`
  String get ChangeEmail {
    return Intl.message(
      'How to change my email address?',
      name: 'ChangeEmail',
      desc: '',
      args: [],
    );
  }

  /// `How to contact customer support?`
  String get ContactSupport {
    return Intl.message(
      'How to contact customer support?',
      name: 'ContactSupport',
      desc: '',
      args: [],
    );
  }

  /// `If you didn't find the answer you're looking for, feel free to contact us directly:`
  String get DidntFindAnswer {
    return Intl.message(
      'If you didn\'t find the answer you\'re looking for, feel free to contact us directly:',
      name: 'DidntFindAnswer',
      desc: '',
      args: [],
    );
  }

  /// `Connect with us on social media:`
  String get ConnectWithUs {
    return Intl.message(
      'Connect with us on social media:',
      name: 'ConnectWithUs',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp`
  String get WhatsApp {
    return Intl.message(
      'WhatsApp',
      name: 'WhatsApp',
      desc: '',
      args: [],
    );
  }

  /// `Messenger`
  String get Messenger {
    return Intl.message(
      'Messenger',
      name: 'Messenger',
      desc: '',
      args: [],
    );
  }

  /// `We appreciate your feedback and strive to improve our service continuously.`
  String get WeAppreciateFeedback {
    return Intl.message(
      'We appreciate your feedback and strive to improve our service continuously.',
      name: 'WeAppreciateFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Privacy and Security`
  String get PrivacyAndSecurity {
    return Intl.message(
      'Privacy and Security',
      name: 'PrivacyAndSecurity',
      desc: '',
      args: [],
    );
  }

  /// `Your privacy and security are important to us. We take the following measures to ensure that your data is protected:`
  String get YourPrivacyAndSecurity {
    return Intl.message(
      'Your privacy and security are important to us. We take the following measures to ensure that your data is protected:',
      name: 'YourPrivacyAndSecurity',
      desc: '',
      args: [],
    );
  }

  /// `Data Encryption: We use industry-standard encryption to protect your data.`
  String get DataEncryption {
    return Intl.message(
      'Data Encryption: We use industry-standard encryption to protect your data.',
      name: 'DataEncryption',
      desc: '',
      args: [],
    );
  }

  /// `Access Control: No personnel can access your data.`
  String get AccessControl {
    return Intl.message(
      'Access Control: No personnel can access your data.',
      name: 'AccessControl',
      desc: '',
      args: [],
    );
  }

  /// `Regular Audits: We conduct regular security audits to identify and fix vulnerabilities.`
  String get RegularAudits {
    return Intl.message(
      'Regular Audits: We conduct regular security audits to identify and fix vulnerabilities.',
      name: 'RegularAudits',
      desc: '',
      args: [],
    );
  }

  /// `User Control: You have control over your data and can manage your settings at any time.`
  String get UserControl {
    return Intl.message(
      'User Control: You have control over your data and can manage your settings at any time.',
      name: 'UserControl',
      desc: '',
      args: [],
    );
  }

  /// `PIN: We use PIN codes to protect your notes and ensure that only you can access them.`
  String get PIN {
    return Intl.message(
      'PIN: We use PIN codes to protect your notes and ensure that only you can access them.',
      name: 'PIN',
      desc: '',
      args: [],
    );
  }

  /// `For any questions or concerns, please contact our support team.`
  String get ForAnyQuestions {
    return Intl.message(
      'For any questions or concerns, please contact our support team.',
      name: 'ForAnyQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get Favorite {
    return Intl.message(
      'Favorite',
      name: 'Favorite',
      desc: '',
      args: [],
    );
  }

  /// `Archive`
  String get Archive {
    return Intl.message(
      'Archive',
      name: 'Archive',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get Save {
    return Intl.message(
      'Save',
      name: 'Save',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get Success {
    return Intl.message(
      'Success',
      name: 'Success',
      desc: '',
      args: [],
    );
  }

  /// `Note saved successfully`
  String get NoteSavedSuccessfully {
    return Intl.message(
      'Note saved successfully',
      name: 'NoteSavedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a title and content`
  String get PleaseEnterTitleAndContent {
    return Intl.message(
      'Please enter a title and content',
      name: 'PleaseEnterTitleAndContent',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get DarkMode {
    return Intl.message(
      'Dark Mode',
      name: 'DarkMode',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Enable Notifications`
  String get EnableNotifications {
    return Intl.message(
      'Enable Notifications',
      name: 'EnableNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Hidden Notes 🤫`
  String get HiddenNotes {
    return Intl.message(
      'Hidden Notes 🤫',
      name: 'HiddenNotes',
      desc: '',
      args: [],
    );
  }

  /// `No hidden notes found.`
  String get NoHiddenNotesFound {
    return Intl.message(
      'No hidden notes found.',
      name: 'NoHiddenNotesFound',
      desc: '',
      args: [],
    );
  }

  /// `Note added successfully!`
  String get NoteAddedSuccessfully {
    return Intl.message(
      'Note added successfully!',
      name: 'NoteAddedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Notes`
  String get FavoriteNotes {
    return Intl.message(
      'Favorite Notes',
      name: 'FavoriteNotes',
      desc: '',
      args: [],
    );
  }

  /// `No Favorite Notes Available`
  String get NoFavoriteNotesAvailable {
    return Intl.message(
      'No Favorite Notes Available',
      name: 'NoFavoriteNotesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Dislike`
  String get Dislike {
    return Intl.message(
      'Dislike',
      name: 'Dislike',
      desc: '',
      args: [],
    );
  }

  /// `No notes available`
  String get NoNotesAvailable {
    return Intl.message(
      'No notes available',
      name: 'NoNotesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Enter PIN`
  String get EnterPIN {
    return Intl.message(
      'Enter PIN',
      name: 'EnterPIN',
      desc: '',
      args: [],
    );
  }

  /// `Enter your PIN`
  String get EnterYourPIN {
    return Intl.message(
      'Enter your PIN',
      name: 'EnterYourPIN',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect PIN`
  String get IncorrectPIN {
    return Intl.message(
      'Incorrect PIN',
      name: 'IncorrectPIN',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get Enter {
    return Intl.message(
      'Enter',
      name: 'Enter',
      desc: '',
      args: [],
    );
  }

  /// `Deleted Notes`
  String get DeletedNotes {
    return Intl.message(
      'Deleted Notes',
      name: 'DeletedNotes',
      desc: '',
      args: [],
    );
  }

  /// `No Deleted Notes Available`
  String get NoDeletedNotesAvailable {
    return Intl.message(
      'No Deleted Notes Available',
      name: 'NoDeletedNotesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Premanent Delete`
  String get PremanentDelete {
    return Intl.message(
      'Premanent Delete',
      name: 'PremanentDelete',
      desc: '',
      args: [],
    );
  }

  /// `Restore`
  String get Restore {
    return Intl.message(
      'Restore',
      name: 'Restore',
      desc: '',
      args: [],
    );
  }

  /// `Create PIN`
  String get CreatePIN {
    return Intl.message(
      'Create PIN',
      name: 'CreatePIN',
      desc: '',
      args: [],
    );
  }

  /// `Enter 12-digit PIN`
  String get Enter12DigitPIN {
    return Intl.message(
      'Enter 12-digit PIN',
      name: 'Enter12DigitPIN',
      desc: '',
      args: [],
    );
  }

  /// `PIN Saved`
  String get PINSaved {
    return Intl.message(
      'PIN Saved',
      name: 'PINSaved',
      desc: '',
      args: [],
    );
  }

  /// `PIN must be 12 digits`
  String get PINMustBe12Digits {
    return Intl.message(
      'PIN must be 12 digits',
      name: 'PINMustBe12Digits',
      desc: '',
      args: [],
    );
  }

  /// `Archived Notes`
  String get ArchivedNotes {
    return Intl.message(
      'Archived Notes',
      name: 'ArchivedNotes',
      desc: '',
      args: [],
    );
  }

  /// `No Archived Notes Available`
  String get NoArchivedNotesAvailable {
    return Intl.message(
      'No Archived Notes Available',
      name: 'NoArchivedNotesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Added to favorites`
  String get AddedToFavorites {
    return Intl.message(
      'Added to favorites',
      name: 'AddedToFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Added to deleted`
  String get AddedToDeleted {
    return Intl.message(
      'Added to deleted',
      name: 'AddedToDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Unarchived`
  String get Unarchived {
    return Intl.message(
      'Unarchived',
      name: 'Unarchived',
      desc: '',
      args: [],
    );
  }

  /// `Deleted from archive`
  String get DeletedFromArchive {
    return Intl.message(
      'Deleted from archive',
      name: 'DeletedFromArchive',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get Close {
    return Intl.message(
      'Close',
      name: 'Close',
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
