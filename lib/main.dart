import 'package:flutter/material.dart';
import 'package:untitled3/bluetooth_pages/bluetooth_enable.dart';
import 'package:untitled3/shared/themes.dart';
import 'package:untitled3/user_pages/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}
var emailController = TextEditingController();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Building',
      theme: mainTheme(),
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}

