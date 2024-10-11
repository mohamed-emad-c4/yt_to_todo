import 'package:flutter/material.dart';
import 'package:yt_to_todo/logic/globalVaribul.dart';
import 'package:yt_to_todo/logic/shared_preferences.dart';
import 'package:yt_to_todo/view/screens/intail/home.dart';

// PageView widget to display initial screens
Widget PageViewInitial() {
  return PageView.builder(
    itemBuilder: (context, index) => widgetIntial[index],
    itemCount: widgetIntial.length,
    onPageChanged: (index) {
      // Update the global variable
    },
  );
}

// Welcome screen
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
                  // Navigate to the next screen
                },
                child: const Text(
                  "→",
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

// Features screen
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
                  // Navigate to the next screen
                },
                child: const Text("التالي"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Initial settings screen
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
                          builder: (context) =>  VideoPlaylistScreen()));
                },
                child: const Text("إنهاء"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
