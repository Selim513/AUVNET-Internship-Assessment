import 'package:auvnet_flutter_assessment/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class OnboardingGradientCircle extends StatelessWidget {
  const OnboardingGradientCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 370,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, AppColors.yellowColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 0.8],
        ),
      ),
    );
  }
}
