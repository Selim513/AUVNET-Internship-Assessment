import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:auvnet_flutter_assessment/core/utils/image_assets.dart';
import 'package:auvnet_flutter_assessment/core/utils/route_services.dart';
import 'package:auvnet_flutter_assessment/core/widgets/custom_elevated_button.dart';
import 'package:auvnet_flutter_assessment/core/widgets/custom_snack_bar.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/manger/auth_bloc/auth_bloc.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/manger/auth_bloc/auth_events.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/manger/auth_bloc/auth_state.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/views/login_view.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/views/widgets/signup_form_field_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrimPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: BlocConsumer<AuthBloc, AuthBlocState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              CustomSnackBar.successSnackBar(state.succMessage, context);

              AppRouteServices.pushReplaceMent(context, page: LoginView());
              context.read<AuthBloc>().close();
            } else if (state is SignUpFailure) {
              CustomSnackBar.errorSnackBar(state.errMessage, context);
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              child: Column(
                spacing: 18,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Image.asset(ImageAssets.logoImage)),
                  SignupFormFieldSection(
                    emailController: emailController,
                    passwordController: passwordController,
                    confrimPasswordController: confrimPasswordController,
                  ),
                  state is SignUpLoading
                      ? CircularProgressIndicator()
                      : CustomElevatedButton(
                          buttonTitle: 'Sign up',
                          onPressed: () {
                            if (formKey.currentState!.validate() &&
                                passwordController.text ==
                                    confrimPasswordController.text) {
                              BlocProvider.of<AuthBloc>(context).add(
                                SignUpEvent(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                            }
                          },
                        ),
                  TextButton(
                    onPressed: () {
                      AppRouteServices.pushReplaceMent(
                        context,
                        page: LoginView(),
                      );
                    },
                    child: Text(
                      'Already have account',
                      style: AppFontStyle.dmSansBold14,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
