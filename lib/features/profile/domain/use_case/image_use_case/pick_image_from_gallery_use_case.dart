import 'package:auvnet_flutter_assessment/features/profile/domain/repo/profile_image_repo.dart';

class PicImageFromGalleryUseCase {
  final ProfileImageRepo repo;
  PicImageFromGalleryUseCase(this.repo);

  Future<String?> call() async {
    return await repo.pickImageFromGallery();
  }
}
