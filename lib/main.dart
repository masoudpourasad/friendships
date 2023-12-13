import 'package:flutter/material.dart';
import 'package:friendships/login/logopage.dart';

void main() => runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: Firstpage()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Firstpage();
  }
}
