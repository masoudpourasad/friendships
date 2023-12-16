import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final Color? color;

  const SquareTile({
    Key? key,
    required this.imagePath,
    required this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      child: Row(
        children: [
          if (color != null)
            ColorFiltered(
              colorFilter: ColorFilter.mode(color!, BlendMode.srcATop),
              child: Image.asset(
                imagePath,
                height: 40,
              ),
            ),
          if (color == null)
            Image.asset(
              imagePath,
              height: 40,
            ),
          const SizedBox(width: 20),
          Text(
            title,
            style: Theme.of(context).textTheme.copyWith().labelSmall,
          ),
        ],
      ),
    );
  }
}
