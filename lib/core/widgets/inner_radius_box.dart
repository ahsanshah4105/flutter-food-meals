import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class InnerRadiusBox extends CustomPainter {
  final double outerRadius;
  final Color color;

  InnerRadiusBox({
    this.outerRadius = 40,
    this.color = Colors.blue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(
        size.width / 2, outerRadius * 2,
        size.width, 0,      // end point
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}