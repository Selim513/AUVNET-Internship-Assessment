import 'package:auvnet_flutter_assessment/core/constant.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/popular_resturant_listview_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularResturantListView extends StatelessWidget {
  const PopularResturantListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 127.h,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Constant.resturantItem.length,
        itemBuilder: (context, index) {
          return PopularResturantListViewBody(
            data: Constant.resturantItem[index],
          );
        },
      ),
    );
  }
}
