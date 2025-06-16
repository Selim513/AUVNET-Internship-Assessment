import 'package:auvnet_flutter_assessment/core/utils/image_assets.dart';
import 'package:auvnet_flutter_assessment/features/onboarding/presentation/views/widgets/onboarding_gradient_circle.dart';
import 'package:flutter/material.dart';

class OnBoardingHeader extends StatelessWidget {
  const OnBoardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned(top: -60, left: -50, child: OnboardingGradientCircle()),
          Center(child: Image.asset(ImageAssets.logoImage)),
        ],
      ),
    );
  }
}
