import 'package:arm_health/config/color.dart';
import 'package:arm_health/page/home_page.dart';
import 'package:arm_health/page/login_page.dart';
import 'package:arm_health/page/register_page.dart';
import 'package:arm_health/page/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'firebase_options.dart';

Future<void> main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: Colorconfig.primary,
          colorScheme: const ColorScheme.light(
              primary: Colorconfig.primary, secondary: Colorconfig.secondary)),
      routes: {
        '/home': (context) => const HomePage(),
        '/signin': (context) => LoginPage(),
        '/signup': (context) => RegisterPage(),
      },
    );
  }
}
