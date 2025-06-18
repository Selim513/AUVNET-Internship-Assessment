import 'package:auvnet_flutter_assessment/core/chache/chache_helper.dart';
import 'package:auvnet_flutter_assessment/core/constant.dart';
import 'package:auvnet_flutter_assessment/core/service_locator/service_locator.dart';
import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HeaderUserInfoSection extends StatefulWidget {
  const HeaderUserInfoSection({super.key});

  @override
  State<HeaderUserInfoSection> createState() => _HeaderUserInfoSectionState();
}

class _HeaderUserInfoSectionState extends State<HeaderUserInfoSection> {
  String? name;
  String? address;
  @override
  void initState() {
    super.initState();
    name = Supabase.instance.client.auth.currentUser!.userMetadata!['Name'];
    address = getIt.get<CacheHelper>().getData(key: LocalCachedKeys.addressKey);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text('Delivering to', style: AppFontStyle.blackDmSansBold14),
        Text(
          address ?? 'Al Satwa, 81A Street',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppFontStyle.blackDmSansBold14.copyWith(fontSize: 16.sp),
        ),
        Text('Hi ${name!.split(" ").first} !', style: AppFontStyle.rubikBold30),
      ],
    );
  }
}
