abstract class UserAddressEvent {}

class SetUserAddressEvent extends UserAddressEvent {
  final String address;
  final String id;

  SetUserAddressEvent({required this.address, required this.id});
}

class GetUserAddressEvent extends UserAddressEvent{}
