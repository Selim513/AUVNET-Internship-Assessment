import 'package:equatable/equatable.dart';

abstract class ProfileEvents extends Equatable {
  const ProfileEvents();

  @override
  List<Object?> get props => [];
}

class GetProfileImageEvent extends ProfileEvents {}



class PickImageFromCameraEvent extends ProfileEvents {}

class PickImageFromGalleryEvent extends ProfileEvents {}
