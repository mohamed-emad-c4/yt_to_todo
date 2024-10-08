import 'package:flutter/material.dart';
import 'package:yt_to_todo/logic/globalVaribul.dart';
import 'package:yt_to_todo/logic/helper.dart';
import 'package:yt_to_todo/logic/shared_preferences.dart';
import 'package:yt_to_todo/view/screens/intail/home.dart';
import 'package:yt_to_todo/view/screens/intail/intail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isIntialized = await SharePrefrenceClass()
      .getVlue(key: "isInitialized", defaultValue: false);
  runApp(MyApp(
    isIntialized: isIntialized,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.isIntialized});
  bool isIntialized;
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
      home: isIntialized ? const HomeScreen() : PageViewInitial(),
    );
  }
}
