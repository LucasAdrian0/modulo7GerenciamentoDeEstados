import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pacotes/pages/splash_screen/splash_screen__delay_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false, primarySwatch: Colors.blue),
      home: const SplashScreenDelayPage(),
    );
  }
}
