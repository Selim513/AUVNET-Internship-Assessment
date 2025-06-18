import 'package:auvnet_flutter_assessment/features/home/data/data_sorce/fetch_promotional_banner_image_data_source.dart';
import 'package:auvnet_flutter_assessment/features/home/domain/repo/promotion_banner_image_repo.dart';

class FetchPromotionalBannerImagesRepoImpl
    extends FetchPromotionalBannerImagesRepo {
  final FetchPromotionalBannerImageDataSourceImpl
  fetchPromotionalBannerImageDataSourceImpl;

  FetchPromotionalBannerImagesRepoImpl(
    this.fetchPromotionalBannerImageDataSourceImpl,
  );
  @override
  Future<List<String>> fetchPromotionalBannerImage() async {
    final response = await fetchPromotionalBannerImageDataSourceImpl
        .fetchPromotionalBannerImage();
    return response;
  }
}
