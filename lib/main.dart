import 'package:flutter/material.dart';
import 'package:friendships/login/logopage.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(219, 234, 233, 223),
  ),
  textTheme: TextTheme(
    labelLarge: GoogleFonts.dancingScript(
      letterSpacing: 1,
      color: Colors.white,
      fontSize: 40,
    ),
    labelMedium: GoogleFonts.dancingScript(
      color: Colors.white,
      fontSize: 32,
    ),
    labelSmall: GoogleFonts.dancingScript(
      color: Colors.white,
      fontSize: 22,
    ),
  ),
);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: const Firstpage());
  }
}
