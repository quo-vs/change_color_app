import 'dart:async';
import 'package:flutter/material.dart';

class TextShowUp extends StatefulWidget {
  final Widget child;
  final int? delay;

  TextShowUp({required this.child, this.delay});

  @override
  _TextShowUpState createState() => _TextShowUpState();
}

class _TextShowUpState extends State<TextShowUp> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animationOffset;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animationController);
    _animationOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.85), end: Offset.zero)
            .animate(curve);

    if (widget.delay == null) {
      _animationController.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay!), () {
        _animationController.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animationOffset,
        child: widget.child,
      ),
      opacity: _animationController,
    );
  }
}