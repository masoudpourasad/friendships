import 'package:flutter/material.dart';

class IconBadge extends StatefulWidget {
  final IconData icon;
  final double? size;
  final Color? color;

  const IconBadge({super.key, required this.icon, this.size, this.color});

  @override
  State<IconBadge> createState() => _IconBadgeState();
}

class _IconBadgeState extends State<IconBadge> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Icon(
          widget.icon,
          size: widget.size,
          color: widget.color,
        ),
        Positioned(
          right: 0.0,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            constraints: const BoxConstraints(
              minWidth: 11,
              minHeight: 11,
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 1),
              child: Text(
                '6',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 9,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
