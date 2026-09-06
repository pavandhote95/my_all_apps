import 'package:flutter/material.dart';
import 'package:pavanportfolio/res/constants.dart';
import 'package:pavanportfolio/view/splash/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),

        scaffoldBackgroundColor: bgColor,
        useMaterial3: true,

        fontFamily: 'Roboto',

        textTheme: Theme.of(context).textTheme.copyWith(
          bodyLarge: const TextStyle(
            color: bodyTextColor,
          ),
          bodyMedium: const TextStyle(
            color: bodyTextColor,
          ),
        ),
      ),

      home: SplashView(),
    );
  }
}