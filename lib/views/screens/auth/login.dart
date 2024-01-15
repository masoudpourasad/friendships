// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:friendships/util/components/my_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:friendships/views/screens/main_screen.dart';
import 'package:friendships/views/widgets/animations/fade_page_route.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final String email;

  const LoginPage({Key? key, required this.email}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final passwordController = TextEditingController();

  final usernameController = TextEditingController();

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
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Theme.of(context).colorScheme.outlineVariant,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                    FadeInDown(
                        duration: const Duration(milliseconds: 3000),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Login",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith()),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    ClipRect(
                      child: BackdropFilter(
                        filter:
                            ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(43, 55, 55, 57)
                                  .withOpacity(_opacity),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30))),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.50,
                          child: Form(
                            key: _formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      FadeInRight(
                                        duration:
                                            const Duration(milliseconds: 3200),
                                        child: CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              'https://img.freepik.com/free-photo/3d-portrait-businessman_23-2150793879.jpg?t=st=1702734732~exp=1702738332~hmac=03e664b1ddfb777508fe06033dc2c1bf9831b63c5e5e0376f6d2ac7c2c07a202&w=1380'),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Flexible(
                                        child: FadeInLeft(
                                          duration: const Duration(
                                              milliseconds: 3200),
                                          child: Text(
                                            'Hello ${widget.email.replaceAll('@icloud.com', '').replaceAll('@gmail.com', '').replaceAll('@hotmail.com', '')}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Divider(
                                    color: Colors.grey.shade500,
                                    indent: 25,
                                    endIndent: 25,
                                    thickness: 0.1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              FadeInRight(
                                                duration: const Duration(
                                                    milliseconds: 3400),
                                                child: TextFormField(
                                                  enabled: false,
                                                  controller:
                                                      usernameController,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                  decoration: InputDecoration(
                                                    iconColor: Colors.white,
                                                    disabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .grey.shade600,
                                                          width: 0.1),
                                                    ),
                                                    errorBorder:
                                                        const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Color.fromARGB(
                                                            255, 71, 233, 133),
                                                      ),
                                                    ),
                                                    errorStyle:
                                                        GoogleFonts.kalam(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              71,
                                                              233,
                                                              133),
                                                    ),
                                                    fillColor:
                                                        Colors.transparent,
                                                    filled: false,
                                                    enabled: true,
                                                    prefixIcon: const Icon(
                                                      Icons.email_outlined,
                                                      color: Colors.white,
                                                    ),
                                                    hintStyle:
                                                        GoogleFonts.kalam(
                                                            color: Colors
                                                                .grey.shade400),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              FadeInLeft(
                                                duration: const Duration(
                                                    milliseconds: 3400),
                                                child: AuthMyPasswordTextField(
                                                  hintText: 'Password',
                                                  obscureText: true,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  FadeIn(
                                    duration:
                                        const Duration(milliseconds: 7000),
                                    child: MyButton(
                                      onTap: () {
                                        Navigator.push(context,
                                            FadePageRoute(MainScreen()));
                                      },
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.grey.shade500,
                                    indent: 25,
                                    endIndent: 25,
                                    thickness: 0.3,
                                  ),
                                  const SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FadeInUp(
                                        duration:
                                            const Duration(milliseconds: 5000),
                                        child: Text('Forgot Password ?',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 71, 233, 133),
                                                fontSize: 10),
                                            textAlign: TextAlign.start),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      )
                                    ],
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
