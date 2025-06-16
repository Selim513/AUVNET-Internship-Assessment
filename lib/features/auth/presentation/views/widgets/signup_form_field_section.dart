import 'package:auvnet_flutter_assessment/core/utils/validator.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignupFormFieldSection extends StatelessWidget {
  const SignupFormFieldSection({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confrimPasswordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confrimPasswordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
      child: Column(
        spacing: 18,
        children: [
          CustomTextFormField(
            hintText: 'Email',
            validator: (value) => checkEmailValidator(value),
            controller: emailController,
            icon: Icons.email_outlined,
          ),
          CustomTextFormField(
            obsecure: true,
            controller: passwordController,
            validator: (value) => checkPasswordValidator(value),
            hintText: 'Password',
            icon: Icons.lock_outline_rounded,
          ),
          CustomTextFormField(
            obsecure: true,
            controller: confrimPasswordController,
            validator: (value) =>
                checkConfirmPasswordValidator(value, passwordController.text),
            hintText: 'Confirm Password',
            icon: Icons.lock_outline_rounded,
          ),
        ],
      ),
    );
  }
}
