import 'package:auvnet_flutter_assessment/features/profile/data/data_source/profile_local_data_source.dart';
import 'package:auvnet_flutter_assessment/features/profile/domain/repo/profile_image_repo.dart';

class ProfileRepoImpl implements ProfileImageRepo {
  final ProfileLocalDataSource localDataSource;

  ProfileRepoImpl(this.localDataSource);

  @override
  String? getProfileImagePath() {
    try {
      var image = localDataSource.getImagePath();
      return image;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<String?> pickImageFromCamera() async {
    try {
      var image = await localDataSource.pickImageFromCamera();
      return image;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<String?> pickImageFromGallery() async {
    try {
      var image = await localDataSource.pickImageFromGallery();
      return image;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
