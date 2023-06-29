import 'package:flutter/material.dart';

class UpFadeAnimation extends StatefulWidget {
  final Widget child;

  const UpFadeAnimation({required this.child});

  @override
  _UpFadeAnimationState createState() => _UpFadeAnimationState();
}

class _UpFadeAnimationState extends State<UpFadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: _animation.value,
          child: Transform.translate(
            offset: Offset(0, (1 - _animation.value) * 100),
            child: widget.child,
          ),
        );
      },
    );
  }
}
