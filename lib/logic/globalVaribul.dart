import 'package:flutter/material.dart';
import 'package:yt_to_todo/view/screens/intail/intail.dart';

bool isIntialized = false;
List<Widget> widgetIntial = [
  const WelcomeScreen(),
  const FeaturesScreen(),
  const InitialSettingsScreen()
];
String API_KEY = "AIzaSyCLTGazN_J6ULDtzvyBkfxccXp-73oMqQs";
String ytAPI ="https://www.googleapis.com/youtube/v3/";
Color PrimaryColor = const Color(0xFFFF0000);
Color PrimaryTextColor = const Color(0xFF282828);
Color SecondaryTextColor = const Color(0xFF909090);
Color SecondaryColor = const Color(0xFFFFFFFF);