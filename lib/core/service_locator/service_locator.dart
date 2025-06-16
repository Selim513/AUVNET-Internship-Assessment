import 'package:auvnet_flutter_assessment/features/auth/data/data_sorce/auth_remote_data_source.dart';
import 'package:auvnet_flutter_assessment/features/auth/data/repo/auth_repo_impl.dart';
import 'package:auvnet_flutter_assessment/features/auth/domain/repo/auth_repo.dart';
import 'package:auvnet_flutter_assessment/features/auth/domain/use_cases/login_use_case.dart';
import 'package:auvnet_flutter_assessment/features/auth/domain/use_cases/signup_use_case.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void serviceLocatorSetup() {
  getIt.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(getIt.get<AuthRemoteDataSource>()),
  );
  //-Login
  getIt.registerSingleton<LoginUseCase>(LoginUseCase(getIt.get<AuthRepo>()));
  //-Signup
  getIt.registerSingleton<SignupUseCase>(SignupUseCase(getIt.get<AuthRepo>()));
}
