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