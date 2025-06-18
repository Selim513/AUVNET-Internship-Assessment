import 'package:auvnet_flutter_assessment/core/service_locator/service_locator.dart';
import 'package:auvnet_flutter_assessment/features/home/domain/uses_case/fetch_promotional_banner_image_use_case.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/manger/fetch_promotional_banner_images_bloc/fetch_promotional_banner_images_bloc.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            BannerImagesBloc(getIt.get<FetchPromotionalBannerUseCase>()),
        child: const HomeViewBody(),
      ),
    );
  }
}
