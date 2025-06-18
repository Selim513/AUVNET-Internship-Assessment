abstract class ProfileImageRepo {
 
  String? getProfileImagePath();
  Future<String?> pickImageFromCamera();
  Future<String?> pickImageFromGallery();
}
