import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/manger/profile_bloc/profile_bloc.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/manger/profile_bloc/profile_event.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/views/widget/bottom_sheet_save_and_cancle_button.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/views/widget/profile_image_bottom_sheet_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileEditBottomSheetBody extends StatefulWidget {
  const ProfileEditBottomSheetBody({
    super.key,
    required this.name,
    this.imagePath,
  });

  final String? name;

  final String? imagePath;
  @override
  State<ProfileEditBottomSheetBody> createState() =>
      _ProfileEditBottomSheetBodyState();
}

class _ProfileEditBottomSheetBodyState
    extends State<ProfileEditBottomSheetBody> {
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        height: 300.sp,
        width: double.infinity,
        child: Column(
          spacing: 10,
          children: [
            ProfileImageBottomSheetBlocBuilder(widget: widget),
            TextButton(
              onPressed: () {
                context.read<ProfileBloc>().add(PickImageFromCameraEvent());
              },
              child: Text(
                'Change profile photo',
                style: AppFontStyle.blueDmSansBold14,
              ),
            ),
            const Divider(),
            CustomTextFormField(
              controller: nameController,
              hintText: widget.name ?? 'user',
              icon: Icons.person_outline,
            ),
            const Spacer(),
            BottomSheetSaveAndCacnleButtons(nameController: nameController),
          ],
        ),
      ),
    );
  }
}
