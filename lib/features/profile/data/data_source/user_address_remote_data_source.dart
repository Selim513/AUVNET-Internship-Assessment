import 'package:auvnet_flutter_assessment/core/chache/chache_helper.dart';
import 'package:auvnet_flutter_assessment/core/constant.dart';
import 'package:auvnet_flutter_assessment/core/service_locator/service_locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserAddressRemoteDataSource {
  Future<void> setUserAddress({
    required String address,
    required String userId,
  });

  Future<String> getUserAddress();
}

class UserAddressRemoteDataSourceImpl extends UserAddressRemoteDataSource {
  @override
  Future<String> getUserAddress() async {
    final userId = getIt.get<SupabaseClient>().auth.currentUser?.id;
    if (userId != null) {
      try {
        final response = await getIt
            .get<SupabaseClient>()
            .from('Address')
            .select()
            .eq('id', userId)
            .maybeSingle();

        return response?['Address'];
      } on Exception catch (e) {
        throw Exception('Exception:${e.toString()}');
      }
    } else {
      return 'No address available';
    }
  }

  @override
  Future<void> setUserAddress({
    required String address,
    required String userId,
  }) async {
    try {
      await getIt.get<SupabaseClient>().from('Address').upsert({
        "Address": address,
        "id": userId,
      });
      await getIt.get<CacheHelper>().savedData(
        key: LocalCachedKeys.addressKey,
        value: address,
      );
    } on Exception catch (e) {
      throw Exception('eeeee${e.toString()}');
    }
  }
}
