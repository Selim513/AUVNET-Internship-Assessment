import 'package:auvnet_flutter_assessment/core/uses_case.dart/use_case.dart';
import 'package:auvnet_flutter_assessment/features/home/domain/uses_case/fetch_promotional_banner_image_use_case.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/manger/fetch_promotional_banner_images_bloc/fetch_promotional_banner_images_event.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/manger/fetch_promotional_banner_images_bloc/fetch_promotional_banner_images_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerImagesBloc extends Bloc<BannerImageEvent, BannerState> {
  final FetchPromotionalBannerUseCase fetchPromotionalBannerUseCase;
  BannerImagesBloc(this.fetchPromotionalBannerUseCase)
    : super((const BannerState())) {
    on<BannerImageEvent>((event, emit) async {
      if (event is BannerLoading) {
        emit(state.copyWith(status: BannerStatus.loading));
      } else if (event is FetchBannerImages) {
        try {
          var bannerImage = await fetchPromotionalBannerUseCase.call(
            NoParams(),
          );
          emit(
            state.copyWith(
              status: BannerStatus.success,
              bannerImages: bannerImage,
            ),
          );
        } catch (e) {
          emit(
            state.copyWith(
              status: BannerStatus.failure,
              errorMessage: e.toString(),
            ),
          );
        }
      }
    });
  }
}
