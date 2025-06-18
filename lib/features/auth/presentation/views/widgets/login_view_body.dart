import 'package:auvnet_flutter_assessment/core/utils/image_assets.dart';
import 'package:auvnet_flutter_assessment/core/utils/route_services.dart';
import 'package:auvnet_flutter_assessment/core/widgets/custom_elevated_button.dart';
import 'package:auvnet_flutter_assessment/core/widgets/custom_snack_bar.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/manger/auth_bloc/auth_bloc.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/manger/auth_bloc/auth_events.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/manger/auth_bloc/auth_state.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/views/sign_up_view.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/views/widgets/login_form_field_section.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: BlocConsumer<AuthBloc, AuthBlocState>(
            listener: (context, state) {
              if (state.succMessage != null) {
                CustomSnackBar.successSnackBar(state.succMessage!, context);
                AppRouteServices.pushReplaceMent(
                  context,
                  page: const BottomNavBar(),
                );
                context.read<AuthBloc>().close();
              } else if (state.errMessage != null) {
                CustomSnackBar.errorSnackBar(state.errMessage!, context);
              }
            },
            builder: (context, state) {
              return Column(
                spacing: 18,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Image.asset(ImageAssets.logoImage)),
                  LoginFormFieldSection(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  state.isLoading
                      ? const CircularProgressIndicator()
                      : CustomElevatedButton(
                          buttonTitle: 'Login',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<AuthBloc>(context).add(
                                LoginEvent(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                            }
                          },
                        ),
                  CustomTextButton(
                    title: 'Create an account',
                    onPressed: () {
                      AppRouteServices.pushReplaceMent(
                        context,
                        page: const SignUpView(),
                      );
                      context.read<AuthBloc>().close();
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
