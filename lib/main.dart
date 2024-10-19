import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:yt_to_todo/logic/cubit/update_home_cubit.dart';
import 'package:yt_to_todo/logic/globalVaribul.dart';
import 'package:yt_to_todo/logic/shared_preferences.dart';
import 'package:yt_to_todo/view/screens/intail/home.dart';
import 'package:yt_to_todo/view/screens/intail/intail.dart';
import 'package:yt_to_todo/view/settings.dart';
import 'generated/l10n.dart';

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
    return BlocProvider(
      create: (context) => UpdateHomeCubit(),
      child: matrial(isIntialized: isIntialized),
    );
  }
}

class matrial extends StatelessWidget {
  const matrial({
    super.key,
    required this.isIntialized,
  });

  final bool isIntialized;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      title: 'YT to Todo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xffe5e5e5)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xffe5e5e5),
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: PrimaryTextColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        useMaterial3: true,
      ),
      home: isIntialized ? const Home() : const PageViewInitial(),
    );
  }
}

// globalVaribul.dart
int currentPageIndex = 0;

List<Widget> widgetIntial = [
  const WelcomeScreen(),
  const FeaturesScreen(),
  const InitialSettingsScreen(),
];

// PageView widget to display initial screens
class PageViewInitial extends StatefulWidget {
  const PageViewInitial({super.key});

  @override
  _PageViewInitialState createState() => _PageViewInitialState();
}

class InitialSettingsScreen extends StatelessWidget {
  const InitialSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "إعدادات أولية",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Image.asset("assets/images/lan.png"),
              const SizedBox(height: 20),
              const Text("قبل أن تبدأ، دعنا نعرف بعض الإعدادات."),
              const SizedBox(height: 40),
              // Dropdown for language selection
              DropdownButton<String>(
                items: <String>['العربية', 'الإنجليزية'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
                hint: const Text("اختر اللغة"),
              ),
              const SizedBox(height: 40),
              // Button to finish onboarding
              ElevatedButton(
                onPressed: () {
                  // Navigate to the main screen
                  SharePrefrenceClass()
                      .saveValuebool(value: true, key: "isInitialized");

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlaylistScreen()));
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("إنهاء"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PageViewInitialState extends State<PageViewInitial> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) => widgetIntial[index],
        itemCount: widgetIntial.length,
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome to YouTube to Todo",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Image.asset("assets/images/welcome.png"),
              const SizedBox(height: 20),
              const Text(
                "استمتع بتجربة مشاهدة مقاطع الفيديو على يوتيوب بطريقة جديدة ومرتبة.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the next screen within the PageView
                  final pageController = PageController();
                  pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "الميزات الرئيسية",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Image.asset("assets/images/feture.png"),
              const SizedBox(height: 20),
              const Column(
                children: [
                  Text("• الحصول على روابط من يوتيوب."),
                  Text("• إضافة ملاحظات لكل فيديو."),
                  Text("• تصنيف مقاطع الفيديو."),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the next screen within the PageView
                  final pageController = PageController();
                  pageController.animateToPage(
                    2,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}