import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BigLikeButton extends StatelessWidget {
  const BigLikeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: const Color(0xFFBE8E9B),
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            blurRadius: 4,
          ),
          BoxShadow(
            color: Colors.pink,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: Colors.white,
          width: 3,
        ),
      ),
      child: const Center(
        child: Icon(
          Iconsax.heart5,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
