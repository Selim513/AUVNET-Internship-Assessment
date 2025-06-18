import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/manger/user_address_bloc/user_address_bloc.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/manger/user_address_bloc/user_address_state.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/views/widget/address_container.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/views/widget/adreess_bottom_sheet_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAddressBloc, UserAddressState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Address:', style: AppFontStyle.titleRubikFont28),

            Stack(
              children: [
                AddressContainer(address: state.address ?? 'Address'),

                Positioned(
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      showBottomSheet(
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (context) =>
                            AddressBottomSheetBody(address: state.address),
                      );
                    },
                    child: Icon(FontAwesomeIcons.pencil, size: 30.sp),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
