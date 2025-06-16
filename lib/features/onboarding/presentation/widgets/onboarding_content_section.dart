import 'package:auvnet_flutter_assessment/core/widgets/custom_elevated_button.dart';
import 'package:auvnet_flutter_assessment/features/onboarding/presentation/widgets/inftro_text_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardingContentSection extends StatelessWidget {
  const OnboardingContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IntroTextSection(),
          Gap(60),
          CustomElevatedButton(buttonTitle: 'Get Started', onPressed: () {}),
          Gap(14),
          TextButton(
            onPressed: () {},
            child: Text(
              'next',
              style: TextStyle(fontSize: 14, color: Color(0xff677294)),
            ),
          ),
        ],
      ),
    );
  }
}
