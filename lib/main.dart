import 'package:cookbook/animated_app/screens/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint(MediaQuery.of(context).size.toString());
    return ScreenUtilInit(
        designSize: const Size(430.0, 932.0),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter CookBook',
            theme: ThemeData(
              scaffoldBackgroundColor: const Color.fromARGB(255, 238, 223, 197),
              primarySwatch: Colors.blue,
              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                fillColor: Colors.white,
                errorStyle: TextStyle(height: 0),
                border: defaultInputBorder,
                enabledBorder: defaultInputBorder,
                focusedBorder: defaultInputBorder,
                errorBorder: defaultInputBorder,
              ),
            ),
            home: const OnboardingScreen(),
          );
        });
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);
