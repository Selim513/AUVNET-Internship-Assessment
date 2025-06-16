import 'package:auvnet_flutter_assessment/features/onboarding/presentation/widgets/custom_onboarding_glow_circle.dart';
import 'package:auvnet_flutter_assessment/features/onboarding/presentation/widgets/onboarding_content_section.dart';
import 'package:flutter/material.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
    required this.title,
    required this.subTitle,
    required this.pageIndex,
    required this.pageController,
  });
  final String title;
  final String subTitle;
  final int pageIndex;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          CustomBottomOnboardingGlowCircle(),
          OnboardingContentSection(
            pageController: pageController,
            title: title,
            subTitle: subTitle,
            pageIndex: pageIndex,
          ),
        ],
      ),
    );
  }
}
