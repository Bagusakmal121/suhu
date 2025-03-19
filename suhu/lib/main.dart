import 'package:flutter/material.dart';
import 'login_page.dart';
import 'my_app.dart';

void main() {
  runApp(const MyAppStarter());
}

class MyAppStarter extends StatefulWidget {
  const MyAppStarter({super.key});

  @override
  State<MyAppStarter> createState() => _MyAppStarterState();
}

class _MyAppStarterState extends State<MyAppStarter> {
  bool isLoggedIn = false;

  void loginSuccess() {
    setState(() {
      isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? const MyApp() : LoginPage(onLoginSuccess: loginSuccess),
    );
  }
}
