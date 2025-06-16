import 'package:auvnet_flutter_assessment/core/constant.dart';
import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:auvnet_flutter_assessment/core/utils/route_services.dart';
import 'package:auvnet_flutter_assessment/core/widgets/custom_elevated_button.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/views/login_view.dart';
import 'package:auvnet_flutter_assessment/features/onboarding/presentation/widgets/inftro_text_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardingContentSection extends StatelessWidget {
  const OnboardingContentSection({
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IntroTextSection(subTitle: subTitle, title: title),
          Gap(60),
          CustomElevatedButton(
            buttonTitle: 'Get Started',
            onPressed: () {
              AppRouteServices.pushReplaceMent(context, page: LoginView());
            },
          ),
          Gap(14),
          TextButton(
            onPressed: () {
              if (pageIndex < onboardingPages.length - 1) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                AppRouteServices.pushReplaceMent(context, page: LoginView());
              }
            },
            child: Text('next', style: AppFontStyle.rubikFont14),
          ),
        ],
      ),
    );
  }
}
