// import 'dart:ui';
// import 'package:animate_do/animate_do.dart';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:friendships/util/components/my_button.dart';
// import 'package:friendships/util/components/auth.dart';
// import 'package:friendships/util/components/square_tile.dart';
// import 'package:friendships/views/screens/auth/logopage.dart';
// import 'package:friendships/views/screens/auth/signin.dart';
// import 'package:friendships/views/widgets/animations/fade_page_route.dart';
// import 'package:google_fonts/google_fonts.dart';

// class WelcomePage extends StatefulWidget {
//   const WelcomePage({super.key});

//   @override
//   State<WelcomePage> createState() => _WelcomePageState();
// }

// class _WelcomePageState extends State<WelcomePage> {
//   final usernameController = TextEditingController();

//   final passwordController = TextEditingController();

//   final double _sigmaX = 5;

//   final double _sigmaY = 5;

//   final double _opacity = 0.2;

//   final _formKey = GlobalKey<FormState>();

//   void signUserIn() {}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/images/women1.jpg',
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height,
//                     fit: BoxFit.cover,
//                   ),
//                   SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.05),
//                         IconButton(
//                           icon: const Icon(Icons.arrow_back_ios),
//                           color: Theme.of(context).colorScheme.outlineVariant,
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               FadePageRoute(
//                                 const LogoPage(),
//                               ),
//                             );
//                           },
//                         ),
//                         SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.25),
//                         Padding(
//                             padding: const EdgeInsets.only(left: 20),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 FadeInDown(
//                                   duration: const Duration(milliseconds: 3000),
//                                   child: Text("Sign Up To Minimalist",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .labelLarge
//                                           ?.copyWith()),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                               ],
//                             )),
//                         SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.02),
//                         ClipRect(
//                           child: BackdropFilter(
//                             filter: ImageFilter.blur(
//                                 sigmaX: _sigmaX, sigmaY: _sigmaY),
//                             child: Container(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 10),
//                               decoration: BoxDecoration(
//                                   color: const Color.fromARGB(43, 55, 55, 57)
//                                       .withOpacity(_opacity),
//                                   borderRadius: const BorderRadius.all(
//                                       Radius.circular(30))),
//                               width: MediaQuery.of(context).size.width * 0.9,
//                               height: MediaQuery.of(context).size.height * 0.50,
//                               child: Form(
//                                 key: _formKey,
//                                 child: SingleChildScrollView(
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       const SizedBox(
//                                         height: 30,
//                                       ),
//                                       FadeIn(
//                                         duration:
//                                             const Duration(milliseconds: 5000),
//                                         child: Padding(
//                                           padding: const EdgeInsets.only(
//                                               right: 28, left: 28),
//                                           child: AuthMyTextField(
//                                             controller: usernameController,
//                                             hintText: 'Email',
//                                             obscureText: false,
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       FadeIn(
//                                         duration:
//                                             const Duration(milliseconds: 5000),
//                                         child: MyButton(
//                                           onTap: (() {
//                                             if (_formKey.currentState!
//                                                 .validate()) {
//                                               Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) => Signup(
//                                                         email:
//                                                             usernameController
//                                                                 .text)),
//                                               );
//                                             } else {
//                                               if (kDebugMode) {
//                                                 print('not valid');
//                                               }
//                                             }
//                                           }),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 15,
//                                       ),
//                                       Row(
//                                         children: [
//                                           Expanded(
//                                             child: Divider(
//                                               indent: 30,
//                                               thickness: 0.3,
//                                               color: Colors.grey.shade400,
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 10.0),
//                                             child: Text('Or',
//                                                 style: Theme.of(context)
//                                                     .textTheme
//                                                     .labelMedium
//                                                     ?.copyWith(
//                                                         fontWeight:
//                                                             FontWeight.bold)),
//                                           ),
//                                           Expanded(
//                                             child: Divider(
//                                               endIndent: 30,
//                                               thickness: 0.3,
//                                               color: Colors.grey.shade400,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       const SizedBox(),
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.min,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             // FadeInLeft(
//                                             //   duration: const Duration(
//                                             //       milliseconds: 2500),
//                                             //   child: const SquareTile(
//                                             //     imagePath:
//                                             //         'assets/images/google.png',
//                                             //     title: "Continue with Google",
//                                             //   ),
//                                             // ),
//                                             Row(
//                                               children: [
//                                                 Expanded(
//                                                   child: Divider(
//                                                     endIndent: 20,
//                                                     indent: 20,
//                                                     thickness: 0.3,
//                                                     color: Colors.grey.shade400,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             const SizedBox(),
//                                             // FadeInRight(
//                                             //   duration: const Duration(
//                                             //       milliseconds: 2500),
//                                             //   child: SquareTile(
//                                             //       color: Colors.grey.shade400,
//                                             //       imagePath:
//                                             //           'assets/images/sms.png',
//                                             //       title:
//                                             //           "Continue with Number"),
//                                             // ),
//                                             Row(
//                                               children: [
//                                                 Expanded(
//                                                   child: Divider(
//                                                     endIndent: 20,
//                                                     indent: 20,
//                                                     thickness: 0.3,
//                                                     color: Colors.grey.shade400,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       const SizedBox(),
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.min,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.stretch,
//                                           children: [
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 FadeInUp(
//                                                   duration: const Duration(
//                                                       milliseconds: 3000),
//                                                   child: Text(
//                                                     'Don\'t have an account?',
//                                                     style: GoogleFonts
//                                                         .dancingScript(
//                                                             color: Colors.white,
//                                                             fontSize: 15),
//                                                     textAlign: TextAlign.start,
//                                                   ),
//                                                 ),
//                                                 const SizedBox(width: 4),
//                                                 FadeInUp(
//                                                   duration: const Duration(
//                                                       milliseconds: 3000),
//                                                   child: Text(
//                                                     'Sign Up ',
//                                                     style: GoogleFonts
//                                                         .dancingScript(
//                                                             color: const Color
//                                                                 .fromARGB(255,
//                                                                 71, 233, 133),
//                                                             fontWeight:
//                                                                 FontWeight.bold,
//                                                             fontSize: 18),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(
//                                                 height: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.01),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 FadeInUp(
//                                                   duration: const Duration(
//                                                       milliseconds: 3300),
//                                                   child: Text(
//                                                       'Forgot Password?',
//                                                       style: GoogleFonts
//                                                           .dancingScript(
//                                                               color:
//                                                                   const Color
//                                                                       .fromARGB(
//                                                                       255,
//                                                                       71,
//                                                                       233,
//                                                                       133),
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold,
//                                                               fontSize: 18),
//                                                       textAlign:
//                                                           TextAlign.start),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
