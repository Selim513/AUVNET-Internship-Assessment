import 'package:auvnet_flutter_assessment/features/home/presentation/manger/fetch_promotional_banner_images_bloc/fetch_promotional_banner_images_state.dart';
import 'package:equatable/equatable.dart';

class AuthBlocState extends Equatable {
  final BlocStatus status;
  final bool isLoading;
  final String? errMessage;
  final String? succMessage;

  const AuthBlocState({
    this.status = BlocStatus.initial,
    this.isLoading = false,
    this.errMessage,
    this.succMessage,
  });
  AuthBlocState copyWith({
    bool? isLoading,
    String? errMessage,
    String? succMessage,
    BlocStatus? status,
  }) {
    return AuthBlocState(
      status: status ?? this.status,
      isLoading: isLoading ?? this.isLoading,
      errMessage: errMessage ?? this.errMessage,
      succMessage: succMessage ?? this.succMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    isLoading,
    succMessage ?? '',
    errMessage ?? '',
    status,
  ];
}
