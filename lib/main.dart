import 'package:flutter/material.dart';
import 'package:yt_to_todo/logic/globalVaribul.dart';

import 'view/screens/intail/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'YT to Todo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xffe5e5e5)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xffe5e5e5),
        ),
        scaffoldBackgroundColor: Color(0xFF14213d),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: PrimaryTextColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
       
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}


