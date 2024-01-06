import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: CustomPaint(
            painter: BackgroundPainter(),
            size: MediaQuery.sizeOf(context),
          ),
        ),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
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
            Offset(-50, size.height / 2 - 250),
            Offset(50, size.height / 2 + 50),
          ),
          const Radius.circular(50),
        ),
      );

    canvas.drawShadow(path, Colors.pink.shade500, 100, false);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
