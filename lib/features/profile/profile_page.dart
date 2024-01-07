import 'package:dating_app/widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: const Center(
          child: Text("Profile Page"),
        ),
      ),
    );
  }
}
