import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String name;
  final String address;

  const UserData({
    required this.name,
    required this.address,s
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'] ?? '',
      address: json['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
    };
  }

  @override
  List<Object> get props => [name, address];

  @override
  String toString() => 'UserData(name: $name, address: $address)';
}