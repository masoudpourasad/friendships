import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) => val!.isEmpty ? 'Invalid E-mail address!' : null,
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.grey.shade400,
      decoration: InputDecoration(
        iconColor: Colors.white,
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 71, 233, 133),
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 71, 233, 133),
          ),
        ),
        errorStyle: GoogleFonts.kalam(
          color: const Color.fromARGB(255, 71, 233, 133),
        ),
        fillColor: Colors.transparent,
        filled: false,
        hintText: hintText,
        enabled: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400, width: 0.5),
        ),
        prefixIcon: const Icon(
          Icons.email_outlined,
          color: Colors.white,
        ),
        hintStyle: GoogleFonts.kalam(color: Colors.grey.shade400),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}

class MyPasswordTextField extends StatelessWidget {
  final dynamic controller;
  final String hintText;
  final bool obscureText;
  const MyPasswordTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) => val!.isEmpty ? 'Invalid password!' : null,
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.grey.shade400,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        iconColor: Colors.white,
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 71, 233, 133),
          ),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 71, 233, 133),
          ),
        ),
        errorStyle: GoogleFonts.kalam(
          color: const Color.fromARGB(255, 71, 233, 133),
        ),
        fillColor: Colors.transparent,
        filled: false,
        hintText: hintText,
        enabled: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400, width: 0.5),
        ),
        prefixIcon: const Icon(
          Icons.password_outlined,
          color: Colors.white,
        ),
        hintStyle: GoogleFonts.kalam(color: Colors.grey.shade400),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
