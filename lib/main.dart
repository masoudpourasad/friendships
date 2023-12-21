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
      letterSpacing: 1,
      color: Colors.white,
      fontSize: 30,
    ),
    labelMedium: GoogleFonts.aBeeZee(
      color: Colors.white,
      fontSize: 32,
    ),
    labelSmall: GoogleFonts.aBeeZee(
      color: Colors.white,
      fontSize: 12,
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
        home: const Firstpage());
  }
}

// ThemeData themeData(ThemeData theme) {
//   return theme.copyWith(
//     textTheme: GoogleFonts.sourceSansProTextTheme(
//       theme.textTheme,
//     ),
//   );
// }
