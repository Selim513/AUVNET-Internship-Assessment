import 'package:auvnet_flutter_assessment/core/uses_case.dart/use_case.dart';
import 'package:auvnet_flutter_assessment/features/home/domain/repo/promotion_banner_image_repo.dart';

class FetchPromotionalBannerUseCase extends UseCase<List<String>, NoParams> {
  final FetchPromotionalBannerImagesRepo bannerRepo;

  FetchPromotionalBannerUseCase(this.bannerRepo);

  @override
  Future<List<String>> call(NoParams params) async {
    return await bannerRepo.fetchPromotionalBannerImage();
  }
}
