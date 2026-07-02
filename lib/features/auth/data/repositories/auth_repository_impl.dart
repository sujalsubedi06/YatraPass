import '../../../../core/storage/secure_storage_service.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl {
  final AuthRemoteDataSource _remoteDataSource =
  AuthRemoteDataSource();

  Future<void> sendOtp({
    required String phoneNumber,
  }) async {
    await _remoteDataSource.sendOtp(
      phoneNumber: phoneNumber,
    );
  }

  Future<void> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    final response =
    await _remoteDataSource.verifyOtp(
      phoneNumber: phoneNumber,
      otp: otp,
    );

    final data = response.data['data'];

    await SecureStorageService.saveTokens(
      accessToken: data['accessToken'],
      refreshToken: data['refreshToken'],
    );
  }

  Future<void> logout() async {
    await _remoteDataSource.logout();

    await SecureStorageService.clearTokens();
  }

  Future<bool> isLoggedIn() async {
    final token =
    await SecureStorageService.getAccessToken();

    return token != null;
  }

  Future<String?> getAccessToken() async {
    return SecureStorageService.getAccessToken();
  }

  Future<String?> getRefreshToken() async {
    return SecureStorageService.getRefreshToken();
  }
}