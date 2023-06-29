import 'package:flutter/material.dart';
import 'package:portfolio/ui/theme.dart';

class CornerTopPainter extends CustomPainter {
  final Color color1, color2;
  final Animation<double> animation;

  CornerTopPainter(this.animation, this.color1, this.color2) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(8, 0);
    path_0.lineTo(300, 0);
    path_0.lineTo(280, 20);
    path_0.lineTo(25, 20);
    path_0.arcToPoint(Offset(20, 25),
        radius: Radius.elliptical(5, 5),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(20, 280);
    path_0.lineTo(0, 300);
    path_0.lineTo(0, 8);
    path_0.arcToPoint(Offset(8, 0),
        radius: Radius.elliptical(8, 8),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();

    final progress = animation.value;
    final paint_0_fill = Paint()
      ..shader = cornerGradient(color1, color2)
          .createShader(Rect.fromLTWH(0, 0, size.width * progress, size.height * progress));

    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(CornerTopPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CornerTopPainter oldDelegate) => false;

}
