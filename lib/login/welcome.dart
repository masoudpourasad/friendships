import 'dart:ui';
import 'package:animate_do/animate_do.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friendships/components/my_button.dart';
import 'package:friendships/components/my_textfield.dart';
import 'package:friendships/components/square_tile.dart';
import 'package:friendships/login/createaccount.dart';
import 'package:friendships/login/logopage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

@override
class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final double _sigmaX = 5;
  final double _sigmaY = 5;
  final double _opacity = 0.2;
  final double _width = 350;
  final double _height = 300;
  final _formKey = GlobalKey<FormState>();

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/women1.jpg',
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: const HomePage(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeIn(
                              duration: const Duration(milliseconds: 3000),
                              child: Text(
                                "Let's Start",
                                style: GoogleFonts.dancingScript(
                                  color: Colors.grey.shade400,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            FadeIn(
                              duration: const Duration(milliseconds: 3000),
                              child: Text(
                                "The Minimalist",
                                style: GoogleFonts.dancingScript(
                                  color: Colors.grey.shade400,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    ClipRect(
                      child: BackdropFilter(
                        filter:
                            ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 46, 55, 76)
                                  .withOpacity(_opacity),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30))),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.50,
                          child: Form(
                            key: _formKey,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  FadeIn(
                                    duration:
                                        const Duration(milliseconds: 5000),
                                    child: MyTextField(
                                      controller: usernameController,
                                      hintText: 'Email',
                                      obscureText: false,
                                    ),
                                  ),

                                  const SizedBox(height: 10),

                                  // sign in button
                                  FadeIn(
                                    duration:
                                        const Duration(milliseconds: 5000),
                                    child: MyButton(
                                      onTap: (() {
                                        if (_formKey.currentState!.validate()) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Createaccount()),
                                          );
                                        } else {
                                          if (kDebugMode) {
                                            print('not valid');
                                          }
                                        }
                                      }),
                                    ),
                                  ),

                                  const SizedBox(height: 10),

                                  Row(
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          indent: 30,
                                          thickness: 0.5,
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text(
                                          'Or',
                                          style: GoogleFonts.dancingScript(
                                              color: Colors.grey.shade100,
                                              fontSize: 22),
                                        ),
                                      ),
                                      Expanded(
                                        child: Divider(
                                          endIndent: 30,
                                          thickness: 0.5,
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 20),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FadeInLeft(
                                          duration: const Duration(
                                              milliseconds: 2500),
                                          child: const SquareTile(
                                            imagePath:
                                                'assets/images/google.png',
                                            title: "Continue with Google",
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Divider(
                                                endIndent: 20,
                                                indent: 20,
                                                thickness: 0.5,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(),
                                        FadeInRight(
                                          duration: const Duration(
                                              milliseconds: 2500),
                                          child: const SquareTile(
                                              imagePath:
                                                  'assets/images/apple.png',
                                              title: "Continue with Apple"),
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Divider(
                                                endIndent: 20,
                                                indent: 20,
                                                thickness: 0.5,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            FadeIn(
                                              child: Text(
                                                'Don\'t have an account?',
                                                style:
                                                    GoogleFonts.dancingScript(
                                                        color: Colors.white,
                                                        fontSize: 15),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            FadeInUp(
                                              duration: const Duration(
                                                  milliseconds: 3000),
                                              child: Text(
                                                'Sign Up ',
                                                style:
                                                    GoogleFonts.dancingScript(
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 71, 233, 133),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                        FadeInUp(
                                          duration: const Duration(
                                              milliseconds: 3300),
                                          child: Text('Forgot Password?',
                                              style: GoogleFonts.dancingScript(
                                                  color: const Color.fromARGB(
                                                      255, 71, 233, 133),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                              textAlign: TextAlign.start),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
