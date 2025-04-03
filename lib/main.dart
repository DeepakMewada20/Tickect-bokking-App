import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movie_ticket/controllers/auth_controller.dart';
import 'package:my_movie_ticket/controllers/calendar_controller.dart';
import 'package:my_movie_ticket/controllers/common_controller.dart';
import 'package:my_movie_ticket/pages/splash_screen.dart';
import 'package:my_movie_ticket/utils/mytheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  Get.put(CommonController());
  Get.put(CalendarController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: MyTheme.myLightTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
