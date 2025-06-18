import 'package:auvnet_flutter_assessment/features/profile/domain/repo/profile_image_repo.dart';

class GetProfileImageUseCase {
  final ProfileImageRepo repo;
  GetProfileImageUseCase(this.repo);

  String? call() {
    return repo.getProfileImagePath();
  }
}
