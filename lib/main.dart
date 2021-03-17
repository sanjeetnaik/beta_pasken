import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF111328),
        scaffoldBackgroundColor: Color(0xFF111328),
      ),
      home: LoginPage(),
    );
  }
}
