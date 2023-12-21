import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:friendships/views/screens/auth/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friendships/util/components/my_button.dart';
import 'package:friendships/util/components/my_textfield.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  final String email;

  const Signup({Key? key, required this.email}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final double _sigmaX = 5;

  final double _sigmaY = 5;

  final double _opacity = 0.2;

  final _formKey = GlobalKey<FormState>();

  void signUserIn() {
    if (_formKey.currentState!.validate()) {
      if (kDebugMode) {
        print('valid');
      }
    } else {
      if (kDebugMode) {
        print('not valid');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    usernameController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/women3.jpeg',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Theme.of(context).colorScheme.outlineVariant,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25),
                        FadeInDown(
                          duration: const Duration(milliseconds: 3000),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Sign In",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: _sigmaX, sigmaY: _sigmaY),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(0, 0, 0, 1)
                                      .withOpacity(_opacity),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30))),
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.50,
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    FadeInLeft(
                                      duration:
                                          const Duration(milliseconds: 3400),
                                      child: Text(
                                          "Look like you don't have an account. Let's create a new account for",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const SizedBox(height: 20),
                                    FadeInRight(
                                      duration:
                                          const Duration(milliseconds: 3400),
                                      child: MyTextField(
                                        controller: usernameController,
                                        hintText: 'Rewrite Email',
                                        obscureText: false,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    FadeInLeft(
                                      duration:
                                          const Duration(milliseconds: 3400),
                                      child: MyPasswordTextField(
                                        controller: passwordController,
                                        hintText: 'Password',
                                        obscureText: true,
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        FadeInUp(
                                          duration: const Duration(
                                              milliseconds: 5000),
                                          child: RichText(
                                            text: TextSpan(
                                              text: '',
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: 'Privacy and Terms',
                                                  style:
                                                      GoogleFonts.dancingScript(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                ),
                                                TextSpan(
                                                  text: ': ',
                                                  style:
                                                      GoogleFonts.dancingScript(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                ),
                                                TextSpan(
                                                  text:
                                                      'By selecting Agree & Continue below,To create  Account, you’ll need to agree to the Terms of Service below.In addition, when you create an account, we process your information as described in our Privacy Policy',
                                                  style:
                                                      GoogleFonts.dancingScript(
                                                          color: Colors.white,
                                                          fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        FadeIn(
                                          duration: const Duration(
                                              milliseconds: 7000),
                                          child: MyButtonAgree(
                                            text: "Continue",
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginPage(
                                                              email:
                                                                  usernameController
                                                                      .text)));
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
