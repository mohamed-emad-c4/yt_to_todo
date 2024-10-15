import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../generated/l10n.dart';
import 'setting_views/about_us.dart';
import 'setting_views/help_and_support.dart';
import 'setting_views/privacy_and_security.dart';

class Setting extends StatelessWidget {
  final bool isDarkMode;

  const Setting({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Settings),
        centerTitle: true,
      ),
      body: SettingsListState(isDarkMode: isDarkMode),
    );
  }
}

class SettingsListState extends StatefulWidget {
  final bool isDarkMode;

  const SettingsListState({super.key, required this.isDarkMode});

  @override
  _SettingsListStateState createState() => _SettingsListStateState();
}

class _SettingsListStateState extends State<SettingsListState> {
  late bool isDarkMode;
  bool notificationsEnabled = true;
  String selectedLanguage = 'en';
  int volume = 50;

  @override
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDarkModeTile(context),
        const Divider(),
        _buildLanguageTile(context),
        const Divider(),
        _buildPrivacyTile(context),
        const Divider(),
        _buildHelpTile(context),
        const Divider(),
        _buildAboutTile(context),
      ],
    );
  }

  // Dark Mode Switch Tile
  ListTile _buildDarkModeTile(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.brightness_6),
      title: Text("Dark Mode"),
    );
  }

  // Language Dropdown Tile
  ListTile _buildLanguageTile(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.language),
        title: Text("Language"), // Use translation
        trailing: DropdownButton<String>(
          value: selectedLanguage,
          onChanged: (String? newValue) {
            setState(() {
              selectedLanguage = newValue!;
            });
          },
          items: <String>['English', 'Spanish', 'French', 'German']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }

  // Notifications Switch Tile
}

// Privacy and Security Tile
ListTile _buildPrivacyTile(BuildContext context) {
  return ListTile(
    leading: const Icon(Icons.lock),
    title: Text("Privacy & Security"),
    onTap: () {
      Get.to(const PrivacyAndSecurityPage());
    },
  );
}

// Help & Support Tile
ListTile _buildHelpTile(BuildContext context) {
  return ListTile(
    leading: const Icon(Icons.help),
    title: Text(S.of(context).HelpSupport),
    onTap: () {
      Get.to(const HelpAndSupportPage());
    },
  );
}

// About Us Tile
ListTile _buildAboutTile(BuildContext context) {
  return ListTile(
    leading: const Icon(Icons.info),
    title: Text(S.of(context).AboutUs),
    onTap: () {
      Get.to(const AboutUsPage());
    },
  );
}

Widget _buildSocialMediaButton(BuildContext context,
    {required FaIcon icon,
    required String label,
    required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).primaryColor,
          child: icon,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    ),
  );
}

void _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunch(uri.toString())) {
    await launch(uri.toString());
  } else {
    Get.snackbar("Error", "Could not launch");
  }
}

void _sendEmail() async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: 'zemax.c4@gmail.com',
    query: 'subject=Help%20Needed&body=Hi%20there,%0D%0A%0D%0A',
  );
  if (await canLaunch(emailUri.toString())) {
    await launch(emailUri.toString());
  } else {
    Get.snackbar("Error", "Could not launch");
  }
}
