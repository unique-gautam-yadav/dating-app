import 'package:dating_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class LikePage extends StatelessWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: const Center(
          child: Text("Like Page"),
        ),
      ),
    );
  }
}
