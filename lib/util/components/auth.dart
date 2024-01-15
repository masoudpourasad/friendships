// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class AuthMyTextField extends StatefulWidget {
//   final String hintText;
//   final bool obscureText;
//   final Function onsave;

//   const AuthMyTextField({
//     super.key,
//     required this.hintText,
//     required this.obscureText,
//     required this.onsave,
//   });

//   @override
//   State<AuthMyTextField> createState() => _AuthMyTextFieldState();
// }

// class _AuthMyTextFieldState extends State<AuthMyTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       validator: (value) {
//         if (value == null || value.trim().isEmpty || !value.contains('@')) {
//           return 'Please enter a valid email address.';
//         }
//         return null;
//       },
//       obscureText: false,
//       textCapitalization: TextCapitalization.none,
//       style: const TextStyle(color: Colors.white),
//       cursorColor: Colors.grey.shade400,
//       decoration: InputDecoration(
//         iconColor: Colors.white,
//         focusedErrorBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(
//             color: Color.fromARGB(255, 71, 233, 133),
//           ),
//         ),
//         errorBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(
//             color: Color.fromARGB(255, 71, 233, 133),
//           ),
//         ),
//         errorStyle: GoogleFonts.kalam(
//           color: const Color.fromARGB(255, 71, 233, 133),
//         ),
//         fillColor: Colors.transparent,
//         filled: false,
//         hintText: widget.hintText,
//         enabled: true,
//         enabledBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.grey.shade400, width: 0.3),
//         ),
//         prefixIcon: const Icon(
//           Icons.email_outlined,
//           color: Colors.white,
//         ),
//         hintStyle: GoogleFonts.kalam(color: Colors.grey.shade400),
//         focusedBorder: const UnderlineInputBorder(
//             borderSide: BorderSide(color: Colors.white)),
//         disabledBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.grey.shade600, width: 0.3),
//         ),
//       ),
//     );
//   }
// }

// class AuthMyusernameTextField extends StatefulWidget {
//   final String hintText;
//   final bool obscureText;
//   final Function onsave;

//   const AuthMyusernameTextField({
//     super.key,
//     required this.hintText,
//     required this.obscureText,
//     required this.onsave,
//   });

//   @override
//   State<AuthMyusernameTextField> createState() =>
//       _AuthMyUsernameTextFieldState();
// }

// class _AuthMyUsernameTextFieldState extends State<AuthMyusernameTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       validator: (value) {
//         if (value == null || value.trim().isEmpty) {
//           return 'Please enter a valid username address.';
//         }
//         return null;
//       },
//       obscureText: false,
//       keyboardType: TextInputType.emailAddress,
//       textCapitalization: TextCapitalization.none,
//       style: const TextStyle(color: Colors.white),
//       cursorColor: Colors.grey.shade400,
//       decoration: InputDecoration(
//         iconColor: Colors.white,
//         focusedErrorBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(
//             color: Color.fromARGB(255, 71, 233, 133),
//           ),
//         ),
//         errorBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(
//             color: Color.fromARGB(255, 71, 233, 133),
//           ),
//         ),
//         errorStyle: GoogleFonts.kalam(
//           color: const Color.fromARGB(255, 71, 233, 133),
//         ),
//         fillColor: Colors.transparent,
//         filled: false,
//         hintText: widget.hintText,
//         enabled: true,
//         enabledBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.grey.shade400, width: 0.3),
//         ),
//         prefixIcon: const Icon(
//           Icons.person,
//           color: Colors.white,
//         ),
//         hintStyle: GoogleFonts.kalam(color: Colors.grey.shade400),
//         focusedBorder: const UnderlineInputBorder(
//             borderSide: BorderSide(color: Colors.white)),
//         disabledBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.grey.shade600, width: 0.3),
//         ),
//       ),
//     );
//   }
// }

// class AuthMyPasswordTextField extends StatefulWidget {
//   final String hintText;
//   final bool obscureText;
//   final Function onsave;

//   const AuthMyPasswordTextField({
//     super.key,
//     required this.hintText,
//     required this.obscureText,
//     required this.onsave,
//   });

//   @override
//   State<AuthMyPasswordTextField> createState() =>
//       _AuthMyPasswordTextFieldState();
// }

// class _AuthMyPasswordTextFieldState extends State<AuthMyPasswordTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       validator: (value) {
//         if (value == null || value.trim().length < 6) {
//           return 'Password must be at least 6 characters long.';
//         }
//         return null;
//       },
//       obscureText: true,
//       cursorColor: Colors.grey.shade400,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         iconColor: Colors.white,
//         focusedErrorBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(
//             color: Color.fromARGB(255, 71, 233, 133),
//           ),
//         ),
//         errorBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(
//             color: Color.fromARGB(255, 71, 233, 133),
//           ),
//         ),
//         errorStyle: GoogleFonts.kalam(
//           color: const Color.fromARGB(255, 71, 233, 133),
//         ),
//         fillColor: Colors.transparent,
//         filled: false,
//         hintText: widget.hintText,
//         enabled: true,
//         enabledBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.grey.shade600, width: 0.3),
//         ),
//         prefixIcon: const Icon(
//           Icons.password_outlined,
//           color: Colors.white,
//         ),
//         hintStyle: GoogleFonts.kalam(color: Colors.grey.shade400),
//         focusedBorder: const UnderlineInputBorder(
//             borderSide: BorderSide(color: Colors.white)),
//         disabledBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.grey.shade600, width: 0.3),
//         ),
//       ),
//     );
//   }
// }
