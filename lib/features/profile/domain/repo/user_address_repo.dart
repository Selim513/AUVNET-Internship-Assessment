abstract class UserAddressRepo {
  Future<void> setUserAddress({
    required String address,
    required String userId,
  });
 
  Future<String> getUserAddress();
}
