import 'package:auvnet_flutter_assessment/core/uses_case.dart/use_case.dart';
import 'package:auvnet_flutter_assessment/features/profile/domain/repo/profile_image_repo.dart';
import 'package:auvnet_flutter_assessment/features/profile/domain/repo/user_address_repo.dart';

class GetUserAddressUseCase extends UseCase<String, NoParams> {
  final UserAddressRepo repo;
  GetUserAddressUseCase(this.repo);
  @override
  Future<String> call(_) async {
    return await repo.getUserAddress();
  }
}
