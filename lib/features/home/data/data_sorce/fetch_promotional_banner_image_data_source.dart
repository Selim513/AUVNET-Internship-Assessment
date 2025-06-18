import 'package:supabase_flutter/supabase_flutter.dart';

abstract class FetchPromotionalBannerImageDataSource {
  Future<List<String>> fetchPromotionalBannerImage();
}

class FetchPromotionalBannerImageDataSourceImpl
    extends FetchPromotionalBannerImageDataSource {
  @override
  Future<List<String>> fetchPromotionalBannerImage() async {
    var supabaseClient = Supabase.instance.client;
    final response = await supabaseClient.storage
        .from('banner-promotion')
        .list();
    if (response.isEmpty) {
      return [];
    }
    // final bannerImages =  response.map((file) {
    //   final url = supabaseClient.storage
    //       .from('banner-promotion')
    //       .getPublicUrl(file.name);
    //   return url;
    // }).toList();
    final bannerImages = await Future.wait(
      response.map((file) async {
        final signedUrlResponse = await supabaseClient.storage
            .from('banner-promotion')
            .createSignedUrl(file.name, 2592000); // 24 ساعة صلاحية

        return signedUrlResponse;
      }),
    );
    return bannerImages;
  }
}
