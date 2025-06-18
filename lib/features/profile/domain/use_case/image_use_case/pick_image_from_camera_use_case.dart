import 'package:auvnet_flutter_assessment/features/profile/domain/repo/profile_image_repo.dart';

class PicImageFromCammeraUseCase {
  final ProfileImageRepo repo;
  PicImageFromCammeraUseCase(this.repo);

  Future<String?> call() async {
    return await repo.pickImageFromCamera();
  }
}
