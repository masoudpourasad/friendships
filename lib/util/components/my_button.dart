import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final Function()? onTap;

  const MyButton({super.key, required this.onTap});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Center(
              child: Text(
                "Continue",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyButtonAgree extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButtonAgree({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Text(text,
                style: Theme.of(context).textTheme.copyWith().labelLarge),
          ),
        ],
      ),
    );
  }
}
