import 'package:flutter/material.dart';

class CustomBottomOnboardingGlowCircle extends StatelessWidget {
  const CustomBottomOnboardingGlowCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -30,
      bottom: -40,
      child: Container(
        width: 216,
        height: 216,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0xff0EBE7E).withAlpha(50),
              spreadRadius: 10,
              blurRadius: 40,
            ),
          ],
        ),
      ),
    );
  }
}
