import 'package:auvnet_flutter_assessment/features/onboarding/presentation/widgets/onboarding_body.dart';
import 'package:auvnet_flutter_assessment/features/onboarding/presentation/widgets/onboarding_header.dart';
import 'package:flutter/material.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [OnBoardingHeader(), OnboardingBody()]);
  }
}
