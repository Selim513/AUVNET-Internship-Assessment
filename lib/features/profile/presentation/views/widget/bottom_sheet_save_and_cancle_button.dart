import 'package:auvnet_flutter_assessment/core/utils/app_color.dart';
import 'package:auvnet_flutter_assessment/core/widgets/custom_elevated_button.dart';
import 'package:auvnet_flutter_assessment/core/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BottomSheetSaveAndCacnleButtons extends StatelessWidget {
  const BottomSheetSaveAndCacnleButtons({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100.sp,
          child: CustomElevatedButton(
            color: AppColors.blackColor,
            buttonTitle: 'Cancle',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 100.sp,
          child: CustomElevatedButton(
            buttonTitle: 'Save',
            onPressed: () async {
              if (nameController.text.isEmpty) {
                Navigator.pop(context);
              } else {
                await Supabase.instance.client.auth
                    .updateUser(
                      UserAttributes(data: {'Name': nameController.text}),
                    )
                    .then((value) {
                      CustomSnackBar.successSnackBar(
                        'Name has Changed to ${nameController.text}',
                        context,
                      );
                      Navigator.pop(context);
                    });
              }
            },
          ),
        ),
      ],
    );
  }
}
