import 'package:equatable/equatable.dart';

class ProfileBlocState extends Equatable {
  final bool isLoading;
  final String? imagePath;
  final String? address;
  final String? errMessage;
  final String? succMessage;

  const ProfileBlocState({
    this.isLoading = false,
    this.imagePath,
    this.errMessage,
    this.succMessage,
    this.address,
  });

  ProfileBlocState copyWith({
    bool? isLoading,
    String? imagePath,
    String? address,
    String? errMessage,
    String? succMessage,
  }) {
    return ProfileBlocState(
      address: address ?? this.address,
      isLoading: isLoading ?? this.isLoading,
      imagePath: imagePath ?? this.imagePath,
      errMessage: errMessage,
      succMessage: succMessage,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    imagePath ?? '',
    errMessage ?? '',
    succMessage ?? '',
  ];
}
