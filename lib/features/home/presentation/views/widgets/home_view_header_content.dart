import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/header_user_info_section.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/header_user_picture.dart';
import 'package:flutter/material.dart';

class HomeViewHeaderContent extends StatelessWidget {
  const HomeViewHeaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [HeaderUserInfoSection(), Spacer(), HeaderUserPicture()],
    );
  }
}
