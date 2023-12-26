import 'package:flutter/material.dart';
import 'package:friendships/views/screens/auth/logopage.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.white,
  ),
  textTheme: TextTheme(
    labelLarge: GoogleFonts.dancingScript(
      color: Colors.white,
      fontSize: 35,
    ),
    labelMedium: GoogleFonts.dancingScript(
      color: Colors.white,
      fontSize: 18,
    ),
    labelSmall: GoogleFonts.dancingScript(
      color: Colors.white,
      fontSize: 15,
    ),
    bodySmall: GoogleFonts.aBeeZee(color: Colors.black, fontSize: 12),
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
        home: const HomePage());
  }
}
