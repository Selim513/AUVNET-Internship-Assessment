import 'package:auvnet_flutter_assessment/features/profile/presentation/models/user_model.dart';

abstract class FetchUserDataRepo {
  Future<UserData> fetchUserDataRepo({required String id});
}
