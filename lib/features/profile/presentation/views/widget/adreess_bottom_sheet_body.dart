import 'package:auvnet_flutter_assessment/core/service_locator/service_locator.dart';
import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:auvnet_flutter_assessment/core/widgets/custom_elevated_button.dart';
import 'package:auvnet_flutter_assessment/core/widgets/custom_snack_bar.dart';
import 'package:auvnet_flutter_assessment/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/manger/user_address_bloc/user_address_bloc.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/manger/user_address_bloc/user_address_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddressBottomSheetBody extends StatefulWidget {
  const AddressBottomSheetBody({super.key, required this.address});
  final String? address;
  @override
  State<AddressBottomSheetBody> createState() => _AddressBottomSheetBodyState();
}

class _AddressBottomSheetBodyState extends State<AddressBottomSheetBody> {
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 300.sp,
      child: Column(
        spacing: 15.sp,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(FontAwesomeIcons.x),
          ),
          Text(
            'Address:',
            style: AppFontStyle.blackDmSansBold14.copyWith(fontSize: 18.sp),
          ),
          CustomTextFormField(
            controller: addressController,
            maxLines: 2,
            hintText: 'New Address',
            icon: FontAwesomeIcons.addressCard,
          ),
          const Spacer(),
          CustomElevatedButton(
            buttonTitle: 'Save',
            onPressed: () async {
              var userId = getIt.get<SupabaseClient>().auth.currentUser!.id;
              final addressText = addressController.text.trim();

              if (addressText.isEmpty) {
                Navigator.pop(context);
                return;
              }

              context.read<UserAddressBloc>().add(
                SetUserAddressEvent(address: addressText, id: userId),
              );
              CustomSnackBar.successSnackBar('Success', context);

              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
