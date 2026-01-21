import 'package:flutter/material.dart';
import 'package:pacotes/pages/splash_screen/splash_screen__delay_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false, primarySwatch: Colors.blue),
      home: const SplashScreenDelayPage(),
    );
  }
}
