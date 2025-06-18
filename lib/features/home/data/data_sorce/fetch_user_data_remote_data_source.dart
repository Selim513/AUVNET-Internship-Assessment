import 'package:auvnet_flutter_assessment/core/service_locator/service_locator.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserDataRemoteDataSource {
  Future<UserData> fetchUserData(String userId);
}

class UserDataRemoteDataSourceImpl implements UserDataRemoteDataSource {
  

  UserDataRemoteDataSourceImpl({
    SupabaseClient? supabaseClient,
  }) ;

  @override
  Future<UserData> fetchUserData(String userId) async {
    try {
      final response = await getIt.get<SupabaseClient>()
          .from('users') 
          .select('name, address')
          .eq('id', userId)
          .single();

      return UserData.fromJson(response);
    } on PostgrestException catch (e) {
      throw Exception('Database error: ${e.message}');
    } catch (e) {
      throw Exception('Failed to fetch user data: $e');
    }
  }
}