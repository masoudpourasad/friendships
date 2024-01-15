import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:friendships/views/screens/auth/user_image_picker.dart';
import 'package:friendships/views/screens/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var _isLogin = true;
  var _enteredPassword = '';

  final double _sigmaX = 5;
  final double _sigmaY = 5;
  final double _opacity = 0.2;

  final _form = GlobalKey<FormState>();
  var _enterdEmail = '';
  File? _selectedImage;
  var _isAuthenticating = false;
  var _enteredUsername = '';

  void _navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const MainScreen(), // Replace YourNextScreen with the actual screen you want to navigate to
      ),
    );
  }

  _submit(BuildContext context) async {
    final isValid = _form.currentState!.validate();
    if (!isValid || !_isLogin && _selectedImage == null) {
      return;
    }

    _form.currentState!.save();

    try {
      setState(() {
        _isAuthenticating = true;
      });

      if (_isLogin) {
        await _firebase.signInWithEmailAndPassword(
          email: _enterdEmail,
          password: _enteredPassword,
        );
      } else {
        final userCredentials = await _firebase.createUserWithEmailAndPassword(
          email: _enterdEmail,
          password: _enteredPassword,
        );
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child('${userCredentials.user!.uid}.jpg');

        await storageRef.putFile(_selectedImage!);
        final imageUrl = await storageRef.getDownloadURL();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredentials.user!.uid)
            .set({
          'username': _enteredUsername,
          'email': _enterdEmail,
          'image_url': imageUrl,
        });
      }
      _navigateToNextScreen();
    } on FirebaseAuthException catch (error) {
      String errorMessage = 'Authentication failed.';

      if (error.code == 'email-already-in-use') {
        errorMessage = 'The email address is already in use.';
      } else if (error.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      }

      setState(() {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errorMessage),
        ));
        _isAuthenticating = false;
      });
    } catch (error) {
      if (kDebugMode) {
        print('Unexpected error: $error');
      }
      // Handle other unexpected errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
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
                      child: Form(
                        key: _form,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.25,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            ClipRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: _sigmaX, sigmaY: _sigmaY),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(43, 55, 55, 57)
                                        .withOpacity(_opacity),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.34,
                                  child: SingleChildScrollView(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      if (!_isLogin)
                                        UserImagePicker(
                                          onPickImage: (pickedImage) =>
                                              _selectedImage = pickedImage,
                                        ),
                                      FadeInLeft(
                                        duration:
                                            const Duration(milliseconds: 3400),
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          obscureText: false,
                                          textCapitalization:
                                              TextCapitalization.none,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          cursorColor: Colors.grey.shade400,
                                          decoration: InputDecoration(
                                            iconColor: Colors.white,
                                            focusedErrorBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 71, 233, 133),
                                              ),
                                            ),
                                            errorBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 71, 233, 133),
                                              ),
                                            ),
                                            errorStyle: GoogleFonts.kalam(
                                              color: const Color.fromARGB(
                                                  255, 71, 233, 133),
                                            ),
                                            fillColor: Colors.transparent,
                                            filled: false,
                                            hintText: 'email',
                                            enabled: true,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade400,
                                                  width: 0.3),
                                            ),
                                            prefixIcon: const Icon(
                                              Icons.email_outlined,
                                              color: Colors.white,
                                            ),
                                            hintStyle: GoogleFonts.kalam(
                                                color: Colors.grey.shade400),
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white)),
                                            disabledBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade600,
                                                  width: 0.3),
                                            ),
                                          ),
                                          autocorrect: false,
                                          validator: (value) {
                                            if (value == null ||
                                                value.trim().isEmpty ||
                                                !value.contains('@')) {
                                              return 'Please enter a valid email address.';
                                            }
                                            return null;
                                          },
                                          onSaved: (value) {
                                            _enterdEmail = value!;
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      if (!_isLogin)
                                        FadeInRight(
                                          duration: const Duration(
                                              milliseconds: 3400),
                                          child: TextFormField(
                                            obscureText: false,
                                            keyboardType: TextInputType.name,
                                            textCapitalization:
                                                TextCapitalization.none,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            cursorColor: Colors.grey.shade400,
                                            decoration: InputDecoration(
                                              iconColor: Colors.white,
                                              focusedErrorBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 71, 233, 133),
                                                ),
                                              ),
                                              errorBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 71, 233, 133),
                                                ),
                                              ),
                                              errorStyle: GoogleFonts.kalam(
                                                color: const Color.fromARGB(
                                                    255, 71, 233, 133),
                                              ),
                                              fillColor: Colors.transparent,
                                              filled: false,
                                              hintText: 'username',
                                              enabled: true,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey.shade400,
                                                    width: 0.3),
                                              ),
                                              prefixIcon: const Icon(
                                                Icons.person,
                                                color: Colors.white,
                                              ),
                                              hintStyle: GoogleFonts.kalam(
                                                  color: Colors.grey.shade400),
                                              focusedBorder:
                                                  const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white)),
                                              disabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey.shade600,
                                                    width: 0.3),
                                              ),
                                            ),
                                            enableSuggestions: false,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty ||
                                                  value.trim().length < 4) {
                                                return 'Please enter at least 4 characters.';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              _enteredUsername = value!;
                                            },
                                          ),
                                        ),
                                      const SizedBox(height: 10),
                                      if (!_isAuthenticating)
                                        FadeInLeft(
                                          duration: const Duration(
                                              milliseconds: 3400),
                                          child: TextFormField(
                                            obscureText: true,
                                            cursorColor: Colors.grey.shade400,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            decoration: InputDecoration(
                                              iconColor: Colors.white,
                                              focusedErrorBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 71, 233, 133),
                                                ),
                                              ),
                                              errorBorder:
                                                  const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 71, 233, 133),
                                                ),
                                              ),
                                              errorStyle: GoogleFonts.kalam(
                                                color: const Color.fromARGB(
                                                    255, 71, 233, 133),
                                              ),
                                              fillColor: Colors.transparent,
                                              filled: false,
                                              hintText: 'password',
                                              enabled: true,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey.shade600,
                                                    width: 0.3),
                                              ),
                                              prefixIcon: const Icon(
                                                Icons.password_outlined,
                                                color: Colors.white,
                                              ),
                                              hintStyle: GoogleFonts.kalam(
                                                  color: Colors.grey.shade400),
                                              focusedBorder:
                                                  const UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white)),
                                              disabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey.shade600,
                                                    width: 0.3),
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.trim().length < 6) {
                                                return 'Password must be at least 6 characters long.';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              _enteredPassword = value!;
                                            },
                                          ),
                                        ),
                                      const SizedBox(height: 30),
                                      if (_isAuthenticating)
                                        const CircularProgressIndicator(),
                                      if (!_isAuthenticating)
                                        ElevatedButton(
                                          onPressed: () {
                                            _submit(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                          ),
                                          child: Text(
                                            _isLogin ? 'Login' : 'Signup',
                                            style: Theme.of(context)
                                                .textTheme
                                                .copyWith()
                                                .labelMedium,
                                          ),
                                        ),
                                      if (!_isAuthenticating)
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              _isLogin = !_isLogin;
                                            });
                                          },
                                          child: Text(
                                            _isLogin
                                                ? 'Create an account'
                                                : 'I already have an account.',
                                            style: Theme.of(context)
                                                .textTheme
                                                .copyWith()
                                                .labelMedium,
                                          ),
                                        ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                    ],
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
