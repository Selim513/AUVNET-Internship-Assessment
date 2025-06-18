import 'package:auvnet_flutter_assessment/core/service_locator/service_locator.dart';
import 'package:auvnet_flutter_assessment/core/utils/route_services.dart';
import 'package:auvnet_flutter_assessment/core/widgets/custom_elevated_button.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/views/login_view.dart';
import 'package:auvnet_flutter_assessment/features/profile/domain/use_case/image_use_case/get_profile_image_use_case.dart';
import 'package:auvnet_flutter_assessment/features/profile/domain/use_case/image_use_case/pick_image_from_camera_use_case.dart';
import 'package:auvnet_flutter_assessment/features/profile/domain/use_case/image_use_case/pick_image_from_gallery_use_case.dart';
import 'package:auvnet_flutter_assessment/features/profile/domain/use_case/user_address/get_user_address_use_case.dart';
import 'package:auvnet_flutter_assessment/features/profile/domain/use_case/user_address/set_user_address_use_case.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/manger/profile_bloc/profile_bloc.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/manger/user_address_bloc/user_address_bloc.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/manger/user_address_bloc/user_address_event.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/views/widget/address_section.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/views/widget/profile_image_and_name_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? name;
  @override
  //-fetch name
  void initState() {
    super.initState();

    name = getIt.get<SupabaseClient>().auth.currentUser!.userMetadata!['Name'];
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileBloc(
            getIt.get<GetProfileImageUseCase>(),
            getIt.get<PicImageFromCammeraUseCase>(),
            getIt.get<PicImageFromGalleryUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => UserAddressBloc(
            getIt.get<GetUserAddressUseCase>(),
            getIt.get<SetUserAddressUseCase>(),
          )..add(GetUserAddressEvent()),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Center(
              child: Column(
                spacing: 10.sp,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileAndNameSection(name: name),
                  Gap(10.sp),

                  const AddressSection(),

                  const Spacer(),
                  
                  CustomElevatedButton(
                    buttonTitle: 'Log out',
                    onPressed: () {
                      Supabase.instance.client.auth
                          .signOut(scope: SignOutScope.global)
                          .then((value) {
                            AppRouteServices.pushReplaceMent(
                              context,
                              page: const LoginView(),
                            );
                          });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
