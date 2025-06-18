
import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({super.key, required this.address});
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.sp,
      width: double.infinity,
      padding: const EdgeInsets.only(right: 30, top: 10, left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 1),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Text(
        address,
        style: AppFontStyle.blackDmSansBold14,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
