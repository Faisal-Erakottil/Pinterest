import 'package:flutter/material.dart';
import 'package:pinterest/presentation/botttomBar/bottombar.dart';
import 'package:pinterest/presentation/homeScreen/home.dart';
import 'package:pinterest/presentation/splashScreen/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pinterest Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home:  const Splash(),
    );
  }
}
