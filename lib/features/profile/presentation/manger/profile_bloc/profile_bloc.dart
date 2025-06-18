import 'package:auvnet_flutter_assessment/features/profile/domain/use_case/image_use_case/get_profile_image_use_case.dart';
import 'package:auvnet_flutter_assessment/features/profile/domain/use_case/image_use_case/pick_image_from_camera_use_case.dart';
import 'package:auvnet_flutter_assessment/features/profile/domain/use_case/image_use_case/pick_image_from_gallery_use_case.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/manger/profile_bloc/profile_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvents, ProfileBlocState> {
  final GetProfileImageUseCase getProfileImageUseCase;

  final PicImageFromCammeraUseCase pickImageFromCameraUseCase;
  final PicImageFromGalleryUseCase pickImageFromGalleryUseCase;

  ProfileBloc(
    this.getProfileImageUseCase,
    this.pickImageFromCameraUseCase,
    this.pickImageFromGalleryUseCase,
  ) : super(const ProfileBlocState()) {
    on<ProfileEvents>((event, emit) async {
      //-get image
      if (event is GetProfileImageEvent) {
        try {
          emit(state.copyWith(isLoading: true));
          final image = getProfileImageUseCase();
          if (image != null) {
            emit(
              state.copyWith(
                isLoading: false,
                imagePath: image,
                succMessage: 'Image loaded.',
              ),
            );
          } else {
            emit(
              state.copyWith(isLoading: false, errMessage: 'No image found.'),
            );
          }
        } catch (e) {
          emit(state.copyWith(isLoading: false, errMessage: e.toString()));
        }
      }
      //-- Pick from Camera
      else if (event is PickImageFromCameraEvent) {
        try {
          emit(state.copyWith(isLoading: true));
          final image = await pickImageFromCameraUseCase();
          if (image != null) {
            emit(
              state.copyWith(
                isLoading: false,
                imagePath: image,
                succMessage: 'Image captured from camera.',
              ),
            );
          } else {
            emit(
              state.copyWith(
                isLoading: false,
                errMessage: 'Image not captured.',
              ),
            );
          }
        } catch (e) {
          emit(state.copyWith(isLoading: false, errMessage: e.toString()));
        }
      }
      //-- Pick from Gallery
      else if (event is PickImageFromGalleryEvent) {
        try {
          emit(state.copyWith(isLoading: true));
          final image = await pickImageFromGalleryUseCase();
          if (image != null) {
            emit(
              state.copyWith(
                isLoading: false,
                imagePath: image,
                succMessage: 'Image selected from gallery.',
              ),
            );
          } else {
            emit(
              state.copyWith(
                isLoading: false,
                errMessage: 'Image not selected.',
              ),
            );
          }
        } catch (e) {
          emit(state.copyWith(isLoading: false, errMessage: e.toString()));
        }
      }
    });
  }
}
