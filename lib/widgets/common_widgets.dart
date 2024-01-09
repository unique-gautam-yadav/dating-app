import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.white, BlendMode.src);
    Path path = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(size.width, -60),
          radius: 100,
        ),
      )
      ..addOval(
        Rect.fromCircle(
          center: Offset(0, size.height - 50),
          radius: 100,
        ),
      )
      ..addOval(
        Rect.fromCircle(
          center: Offset(size.width, size.height - 100),
          radius: 100,
        ),
      )
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromPoints(
            Offset(-50, size.height / 2),
            Offset(20, size.height / 2 + 90),
          ),
          const Radius.circular(50),
        ),
      );

    canvas.drawShadow(
      path,
      Colors.pink.shade500,
      100,
      true,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
