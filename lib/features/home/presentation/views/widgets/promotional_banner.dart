import 'package:auvnet_flutter_assessment/features/home/presentation/manger/fetch_promotional_banner_images_bloc/fetch_promotional_banner_images_bloc.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/manger/fetch_promotional_banner_images_bloc/fetch_promotional_banner_images_event.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/manger/fetch_promotional_banner_images_bloc/fetch_promotional_banner_images_state.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/custom_smoth_page_indicator.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/promotional_banner_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PromotionalBanner extends StatefulWidget {
  const PromotionalBanner({super.key});

  @override
  State<PromotionalBanner> createState() => _PromotionalBannerState();
}

class _PromotionalBannerState extends State<PromotionalBanner> {
  int curruntIndex = 0;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BannerImagesBloc>(context).add(FetchBannerImages());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerImagesBloc, BannerState>(
      builder: (context, state) {
        if (state.bannerImages.isNotEmpty) {
          var image = state.bannerImages;
          return DefaultTabController(
            length: state.bannerImages.length + 1,
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: state.bannerImages.length,
                  itemBuilder: (context, index, realIndex) {
                    return PromotionalBannerImage(image: image[index]);
                  },
                  options: CarouselOptions(
                    height: 180.sp,
                    viewportFraction: 1,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 15),
                    autoPlayAnimationDuration: const Duration(seconds: 3),
                    enlargeCenterPage: true,

                    onPageChanged: (index, reason) {
                      setState(() {
                        curruntIndex = index;
                      });
                    },
                  ),
                ),
                Gap(10.sp),
                CustomSmothPageIndicator(
                  curruntIndex: curruntIndex,
                  count: state.bannerImages.length,
                ),
              ],
            ),
          );
        } else if (state.status == BannerStatus.failure) {
          return const Center(child: Text('There is an error'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
