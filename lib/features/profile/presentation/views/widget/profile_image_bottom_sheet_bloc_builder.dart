import 'dart:io';

import 'package:auvnet_flutter_assessment/core/utils/image_assets.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/manger/profile_bloc/profile_bloc.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/manger/profile_bloc/profile_state.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/views/widget/profile_edit_bottom_sheet_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImageBottomSheetBlocBuilder extends StatelessWidget {
  const ProfileImageBottomSheetBlocBuilder({super.key, required this.widget});

  final ProfileEditBottomSheetBody widget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileBlocState>(
      builder: (context, state) {
        final hasNewImage =
            state.imagePath != null && state.imagePath!.isNotEmpty;

        return CircleAvatar(
          radius: 40.sp,
          backgroundImage: hasNewImage
              ? FileImage(File(state.imagePath!)) as ImageProvider
              : (widget.imagePath != null && widget.imagePath!.isNotEmpty)
              ? FileImage(File(widget.imagePath!))
              : AssetImage(ImageAssets.profile),
        );
      },
    );
  }
}
