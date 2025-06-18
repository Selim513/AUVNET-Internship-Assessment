import 'package:auvnet_flutter_assessment/features/profile/data/data_source/user_address_remote_data_source.dart';
import 'package:auvnet_flutter_assessment/features/profile/domain/repo/user_address_repo.dart';

class UserAddressRepoImpl extends UserAddressRepo {
  final UserAddressRemoteDataSource userAddressdata;

  UserAddressRepoImpl(this.userAddressdata);
  @override
  Future<String> getUserAddress() async {
    try {
      String address = await userAddressdata.getUserAddress();
      return address;
    } on Exception catch (e) {
      throw Exception('Exception:${e.toString()}');
    }
  }

  @override
  Future<void> setUserAddress({
    required String address,
    required String userId,
  }) async {
    try {
      await userAddressdata.setUserAddress(address: address, userId: userId);
    } on Exception catch (e) {
      Exception('Exception: ${e.toString()}');
    }
  }
}
