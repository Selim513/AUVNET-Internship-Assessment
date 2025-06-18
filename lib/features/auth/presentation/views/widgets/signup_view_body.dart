import 'package:auvnet_flutter_assessment/core/utils/image_assets.dart';
import 'package:auvnet_flutter_assessment/core/utils/route_services.dart';
import 'package:auvnet_flutter_assessment/core/widgets/custom_elevated_button.dart';
import 'package:auvnet_flutter_assessment/core/widgets/custom_snack_bar.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/manger/auth_bloc/auth_bloc.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/manger/auth_bloc/auth_events.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/manger/auth_bloc/auth_state.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/views/login_view.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/views/widgets/signup_form_field_section.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/manger/fetch_promotional_banner_images_bloc/fetch_promotional_banner_images_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<AuthBloc, AuthBlocState>(
          listener: (context, state) {
            if (state.status == BlocStatus.success) {
              CustomSnackBar.confrimEmailSnackBar(state.succMessage!, context);

              AppRouteServices.pushReplaceMent(
                context,
                page: const LoginView(),
              );
              
            } else if (state.errMessage != null) {
              
              CustomSnackBar.errorSnackBar(state.errMessage!, context);
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
                    nameController: nameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    confrimPasswordController: confirmPasswordController,
                  ),
                  state.isLoading
                      ? const CircularProgressIndicator()
                      : CustomElevatedButton(
                          buttonTitle: 'Sign up',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                          
                              BlocProvider.of<AuthBloc>(context).add(
                                SignUpEvent(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                            }
                          },
                        ),
                  CustomTextButton(
                    title: 'Already have account',
                    onPressed: () {
                      AppRouteServices.pushReplaceMent(
                        context,
                        page: const LoginView(),
                      );
                    },
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
