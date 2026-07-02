import '../../data/models/user_model.dart';

abstract class AuthRepository {
  Future<void> sendOtp({
    required String phoneNumber,
  });

  Future<void> verifyOtp({
    required String phoneNumber,
    required String otp,
  });

  Future<UserModel> getCurrentUser();

  Future<void> logout();

  Future<bool> isLoggedIn();

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();
}