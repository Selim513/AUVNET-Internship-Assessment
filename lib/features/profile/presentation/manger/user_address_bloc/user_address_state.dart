import 'package:equatable/equatable.dart';

class UserAddressState extends Equatable {
  final String? address;
  final String? succMessage;
  final String? errMesagge;
  final bool? isLoading;

  const UserAddressState({
    this.address,
    this.succMessage,
    this.errMesagge,
    this.isLoading,
  });

  UserAddressState copyWith({
    String? address,
    bool? isLoading,
    String? errMesagge,
    String? succMessage,
  }) {
    return UserAddressState(
      address: address ?? this.address,
      succMessage: succMessage ?? this.succMessage,
      errMesagge: errMesagge ?? this.errMesagge,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    address ?? '',
    succMessage ?? '',
    errMesagge ?? '',
  ];
}
