import 'package:auvnet_flutter_assessment/core/constant.dart';
import 'package:auvnet_flutter_assessment/features/onboarding/presentation/widgets/onboarding_body.dart';
import 'package:auvnet_flutter_assessment/features/onboarding/presentation/widgets/onboarding_header.dart';
import 'package:flutter/material.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  int pageIndex = 0;
  final PageController _pageController = PageController();
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: (value) {
        pageIndex = value;
        setState(() {});
      },
      itemCount: onboardingPages.length,

      itemBuilder: (context, index) {
        final onboardingText = onboardingPages[index];
        return Column(
          children: [
            OnBoardingHeader(),
            OnboardingBody(
              pageController: _pageController,
              pageIndex: pageIndex,
              title: onboardingText.title,
              subTitle: onboardingText.subTitle,
            ),
          ],
        );
      },
    );
  }
}
