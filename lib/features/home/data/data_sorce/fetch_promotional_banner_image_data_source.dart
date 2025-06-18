import 'package:auvnet_flutter_assessment/core/service_locator/service_locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class FetchPromotionalBannerImageDataSource {
  Future<List<String>> fetchPromotionalBannerImage();
}

class FetchPromotionalBannerImageDataSourceImpl
    extends FetchPromotionalBannerImageDataSource {
  @override
  Future<List<String>> fetchPromotionalBannerImage() async {
    final response = await getIt
        .get<SupabaseClient>()
        .storage
        .from('banner-promotion')
        .list();
    if (response.isEmpty) {
      return [];
    }

    final bannerImages = await Future.wait(
      response.map((file) async {
        final signedUrlResponse = await getIt
            .get<SupabaseClient>()
            .storage
            .from('banner-promotion')
            .createSignedUrl(file.name, 2592000);

        return signedUrlResponse;
      }),
    );
    return bannerImages;
  }
}
