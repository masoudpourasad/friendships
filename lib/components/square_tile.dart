import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final String title;
  const SquareTile({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 40,
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: GoogleFonts.dancingScript(
              color: Colors.grey.shade100,
              fontSize: 25,
            ),
          )
        ],
      ),
    );
  }
}
