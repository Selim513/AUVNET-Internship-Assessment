import 'package:auvnet_flutter_assessment/features/onboarding/presentation/widgets/custom_onboarding_glow_circle.dart';
import 'package:auvnet_flutter_assessment/features/onboarding/presentation/widgets/onboarding_content_section.dart';
import 'package:flutter/material.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          CustomBottomOnboardingGlowCircle(),
          OnboardingContentSection(),
        ],
      ),
    );
  }
}
