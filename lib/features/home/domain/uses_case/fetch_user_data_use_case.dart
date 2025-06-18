import 'package:auvnet_flutter_assessment/features/home/domain/repo/fetch_user_data.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/models/user_model.dart';

class FetchUserDataUseCase {
  final FetchUserDataRepo _repository;

  FetchUserDataUseCase({required FetchUserDataRepo repository})
    : _repository = repository;

  Future<UserData> call(String userId) async {
    if (userId.isEmpty) {
      throw Exception('User ID cannot be empty');
    }

    return await _repository.fetchUserDataRepo(id: userId);
  }
}
