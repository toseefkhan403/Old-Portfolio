import 'package:flutter/material.dart';
import 'package:portfolio/ui/theme.dart';

class CornerBottomPainter extends CustomPainter {
  final Color color1, color2;
  final Animation<double> animation;

  CornerBottomPainter(this.animation, this.color1, this.color2)
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(292, 300);
    path_0.lineTo(0, 300);
    path_0.lineTo(20, 280);
    path_0.lineTo(275, 280);
    path_0.arcToPoint(Offset(280, 275),
        radius: Radius.elliptical(5, 5),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(280, 20);
    path_0.lineTo(300, 0);
    path_0.lineTo(300, 292);
    path_0.arcToPoint(Offset(292, 300),
        radius: Radius.elliptical(8, 8),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();

    // Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    // paint_0_fill.color = Colors.white.withOpacity(1.0);
    final progress = animation.value;
    final paint_0_fill = Paint()
      ..shader = cornerGradient(color1, color2)
          .createShader(Rect.fromLTWH(0, 0, size.width * progress, size.height * progress));

    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(CornerBottomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CornerBottomPainter oldDelegate) => false;
}
