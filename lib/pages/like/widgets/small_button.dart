
import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({
    super.key,
    required this.isLeft,
    required this.icon,
  });

  final bool isLeft;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 3,
          ),
          BoxShadow(
            color: Colors.pink.shade200,
            blurRadius: 4,
            offset: isLeft ? const Offset(-2, 2) : const Offset(2, 2),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          icon,
          color: const Color.fromARGB(255, 161, 120, 130),
          size: 30,
        ),
      ),
    );
  }
}
