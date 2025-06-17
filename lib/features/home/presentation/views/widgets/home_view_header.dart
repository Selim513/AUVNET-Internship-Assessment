import 'package:auvnet_flutter_assessment/core/utils/app_color.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/home_view_header_content.dart';
import 'package:flutter/material.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      width: double.infinity,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, AppColors.yellowColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 0.8],
        ),
      ),
      child: HomeViewHeaderContent(),
    );
  }
}
