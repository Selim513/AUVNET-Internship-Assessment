import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:auvnet_flutter_assessment/core/utils/image_assets.dart';
import 'package:auvnet_flutter_assessment/core/widgets/custom_elevated_button.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Column(
          spacing: 18,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset(ImageAssets.logoImage)),
            CustomTextFormField(hintText: 'Email', icon: Icons.email_outlined),
            CustomTextFormField(
              hintText: 'Password',
              icon: Icons.lock_outline_rounded,
            ),
            CustomTextFormField(
              hintText: 'Confirm Password',
              icon: Icons.lock_outline_rounded,
            ),
            CustomElevatedButton(buttonTitle: 'Sign up', onPressed: () {}),
            TextButton(
              onPressed: () {},
              child: Text(
                'Already have account',
                style: AppFontStyle.dmSansBold14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
