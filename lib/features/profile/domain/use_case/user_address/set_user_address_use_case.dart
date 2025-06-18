import 'package:auvnet_flutter_assessment/features/profile/domain/repo/user_address_repo.dart';

class SetUserAddressUseCase {
  final UserAddressRepo repo;
  SetUserAddressUseCase(this.repo);

  Future<void> call({required String address, required String userId}) async {
    return await repo.setUserAddress(address: address, userId: userId);
  }
}
