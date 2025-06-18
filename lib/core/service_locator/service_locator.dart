import 'package:auvnet_flutter_assessment/core/chache/chache_helper.dart';
import 'package:auvnet_flutter_assessment/core/constant.dart';
import 'package:auvnet_flutter_assessment/features/auth/data/data_sorce/auth_remote_data_source.dart';
import 'package:auvnet_flutter_assessment/features/auth/data/repo/auth_repo_impl.dart';
import 'package:auvnet_flutter_assessment/features/auth/domain/repo/auth_repo.dart';
import 'package:auvnet_flutter_assessment/features/auth/domain/use_cases/login_use_case.dart';
import 'package:auvnet_flutter_assessment/features/auth/domain/use_cases/signup_use_case.dart';
import 'package:auvnet_flutter_assessment/features/home/data/data_sorce/fetch_promotional_banner_image_data_source.dart';
import 'package:auvnet_flutter_assessment/features/home/data/repo/fetch_promotional_banner_images_repo_impl.dart';
import 'package:auvnet_flutter_assessment/features/home/domain/repo/promotion_banner_image_repo.dart';
import 'package:auvnet_flutter_assessment/features/home/domain/uses_case/fetch_promotional_banner_image_use_case.dart';
import 'package:auvnet_flutter_assessment/features/profile/data/data_source/profile_local_data_source.dart';
import 'package:auvnet_flutter_assessment/features/profile/data/data_source/user_address_remote_data_source.dart';
import 'package:auvnet_flutter_assessment/features/profile/data/repo/profile_repo_impl.dart';
import 'package:auvnet_flutter_assessment/features/profile/data/repo/user_address_repo_impl.dart';
import 'package:auvnet_flutter_assessment/features/profile/domain/repo/profile_image_repo.dart';
import 'package:auvnet_flutter_assessment/features/profile/domain/repo/user_address_repo.dart';
import 'package:auvnet_flutter_assessment/features/profile/domain/use_case/image_use_case/get_profile_image_use_case.dart';
import 'package:auvnet_flutter_assessment/features/profile/domain/use_case/image_use_case/pick_image_from_camera_use_case.dart';
import 'package:auvnet_flutter_assessment/features/profile/domain/use_case/image_use_case/pick_image_from_gallery_use_case.dart';
import 'package:auvnet_flutter_assessment/features/profile/domain/use_case/user_address/get_user_address_use_case.dart';
import 'package:auvnet_flutter_assessment/features/profile/domain/use_case/user_address/set_user_address_use_case.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/manger/profile_bloc/profile_bloc.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/manger/user_address_bloc/user_address_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;
void serviceLocatorSetup() {
  //-------------------------------------------------------------SharedPreferences
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  //--------------------------------------------------------------------Auth
  getIt.registerSingleton<AuthRemoteDataSource>(AuthRemoteDataSourceImpl());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(getIt.get<AuthRemoteDataSource>()),
  );
  //-Login
  getIt.registerSingleton<LoginUseCase>(LoginUseCase(getIt.get<AuthRepo>()));
  //-Signup
  getIt.registerSingleton<SignupUseCase>(SignupUseCase(getIt.get<AuthRepo>()));
  //---------------------------------------------------------------Fetch Banner Image---
  getIt.registerSingleton<FetchPromotionalBannerImageDataSourceImpl>(
    FetchPromotionalBannerImageDataSourceImpl(),
  );

  getIt.registerSingleton<FetchPromotionalBannerImagesRepo>(
    FetchPromotionalBannerImagesRepoImpl(
      getIt.get<FetchPromotionalBannerImageDataSourceImpl>(),
    ),
  );

  getIt.registerSingleton<FetchPromotionalBannerUseCase>(
    FetchPromotionalBannerUseCase(
      getIt.get<FetchPromotionalBannerImagesRepo>(),
    ),
  );
  //------------------------------------------------------ProfileBloc
  getIt.registerSingleton<ProfileLocalDataSource>(ProfileLocalDataSourceImpl());
  getIt.registerSingleton<ProfileImageRepo>(
    ProfileRepoImpl(getIt.get<ProfileLocalDataSource>()),
  );
  //----get profile image use case-
  getIt.registerSingleton<GetProfileImageUseCase>(
    GetProfileImageUseCase(getIt.get<ProfileImageRepo>()),
  );
  //----pick Profile Image From Camera UseCase
  getIt.registerSingleton<PicImageFromCammeraUseCase>(
    PicImageFromCammeraUseCase(getIt.get<ProfileImageRepo>()),
  );
  //----Pick profile image from gallery
  getIt.registerSingleton<PicImageFromGalleryUseCase>(
    PicImageFromGalleryUseCase(getIt.get<ProfileImageRepo>()),
  );
  //---ProfileBloc
  getIt.registerSingleton<ProfileBloc>(
    ProfileBloc(
      getIt.get<GetProfileImageUseCase>(),
      getIt.get<PicImageFromCammeraUseCase>(),
      getIt.get<PicImageFromGalleryUseCase>(),
    ),
  );
  //-----------------------------------------------------------UserAddress
  getIt.registerSingleton<UserAddressRemoteDataSource>(
    UserAddressRemoteDataSourceImpl(),
  );
  //-
  getIt.registerSingleton<UserAddressRepo>(
    UserAddressRepoImpl(getIt.get<UserAddressRemoteDataSource>()),
  );
  //----get User Address uses case
  getIt.registerSingleton<GetUserAddressUseCase>(
    GetUserAddressUseCase(getIt.get<UserAddressRepo>()),
  );
  //----set User address uses case
  getIt.registerSingleton<SetUserAddressUseCase>(
    SetUserAddressUseCase(getIt.get<UserAddressRepo>()),
  );

  getIt.registerSingleton<UserAddressBloc>(
    UserAddressBloc(
      getIt.get<GetUserAddressUseCase>(),
      getIt.get<SetUserAddressUseCase>(),
    ),
  );
  //-supabase instance
  getIt.registerSingleton<SupabaseClient>(
    SupabaseClient(SupabaseSecrtKeys.urlKey, SupabaseSecrtKeys.anonKey),
  );
}
