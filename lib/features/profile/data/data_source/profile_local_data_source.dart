import 'package:auvnet_flutter_assessment/core/chache/chache_helper.dart';
import 'package:auvnet_flutter_assessment/core/constant.dart';
import 'package:auvnet_flutter_assessment/core/service_locator/service_locator.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileLocalDataSource {
  String? getImagePath();
  Future<String?> pickImageFromCamera();
  Future<String?> pickImageFromGallery();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  var imagePicker = ImagePicker();
  @override
  String? getImagePath() {
    var data = getIt.get<CacheHelper>().getData(key: LocalCachedKeys.imageKey);
    return data;
  }

  @override
  Future<String?> pickImageFromCamera() async {
    var imagePath = await imagePicker.pickImage(source: ImageSource.camera);
    if (imagePath == null) {
      return null;
    }

    getIt.get<CacheHelper>().savedData(
      key: LocalCachedKeys.imageKey,
      value: imagePath.path,
    );
    return imagePath.path;
  }

  @override
  Future<String?> pickImageFromGallery() async {
    var imagePath = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagePath == null) {
      return null;
    }

    getIt.get<CacheHelper>().savedData(
      key: LocalCachedKeys.imageKey,
      value: imagePath.path,
    );
    return imagePath.path;
  }
}
