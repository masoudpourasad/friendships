import 'package:flutter/material.dart';

class TypeWrite extends StatefulWidget {
  final String word;
  final TextStyle? style;
  final double? textScaleFactor;
  final int seconds;

  const TypeWrite({
    super.key,
    required this.word,
    this.style,
    this.textScaleFactor,
    this.seconds = 4,
  });

  @override
  State<TypeWrite> createState() => _TypeWriteState();
}

class _TypeWriteState extends State<TypeWrite> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    animate();
  }

  late AnimationController controller;

  animate() async {
    controller = AnimationController(
      duration: Duration(seconds: widget.seconds),
      vsync: this,
    );
    setState(() {
      _stringIndex = _stringIndex == null ? 0 : _stringIndex! + 1;
      _characterCount = StepTween(begin: 0, end: widget.word.length)
          .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    });

    await controller.forward();
  }

  late Animation<int> _characterCount;

  int? _stringIndex;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _characterCount,
      builder: (BuildContext context, Widget? child) {
        String text = widget.word.substring(0, _characterCount.value);
        return Text(
          text,
          style: widget.style,
          textAlign: TextAlign.center,
        );
      },
    );
  }
}
