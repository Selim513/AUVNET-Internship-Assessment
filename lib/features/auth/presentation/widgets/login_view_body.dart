import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:auvnet_flutter_assessment/core/utils/image_assets.dart';
import 'package:auvnet_flutter_assessment/core/utils/route_services.dart';
import 'package:auvnet_flutter_assessment/core/widgets/custom_elevated_button.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/views/sign_up_view.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          CustomElevatedButton(buttonTitle: 'Login', onPressed: () {}),
          TextButton(
            onPressed: () {
              AppRouteServices.push(context, page: SignUpView());
            },
            child: Text('Create an account', style: AppFontStyle.dmSansBold14),
          ),
        ],
      ),
    );
  }
}
