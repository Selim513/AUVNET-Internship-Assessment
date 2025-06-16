import 'package:auvnet_flutter_assessment/core/utils/validator.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginFormFieldSection extends StatelessWidget {
  const LoginFormFieldSection({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        spacing: 18,
        children: [
          CustomTextFormField(
            controller: emailController,
            hintText: 'Email',
            validator: (value) => checkEmailValidator(value),
            icon: Icons.email_outlined,
          ),
          CustomTextFormField(
            obsecure: true,
            controller: passwordController,
            hintText: 'Password',
            icon: Icons.lock_outline_rounded,
            validator: (value) => checkPasswordValidator(value),
          ),
        ],
      ),
    );
  }
}
