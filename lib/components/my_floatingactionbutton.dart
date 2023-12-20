import 'package:flutter/material.dart';

class Floatingactionbutton extends StatelessWidget {
  const Floatingactionbutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      margin: const EdgeInsets.symmetric(horizontal: 80),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.2),
        borderRadius: BorderRadius.circular(60),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.message, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.heart_broken, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_search_rounded, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.mobile_friendly, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_2_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
