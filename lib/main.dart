import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:friendships/views/screens/splash.dart';
import 'package:friendships/views/screens/logopage.dart';
import 'package:friendships/views/screens/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';

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
    labelMedium: GoogleFonts.aBeeZee(
      color: Colors.blue,
      fontSize: 15,
    ),
    labelSmall: GoogleFonts.dancingScript(
      color: Colors.white,
      fontSize: 15,
    ),
    bodySmall: GoogleFonts.aBeeZee(color: Colors.black, fontSize: 12),
  ),
);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          }
          if (snapshot.hasData) {
            return const MainScreen();
          }
          return const LogoPage();
        },
      ),
    );
  }
}
