import '../../../../core/network/error_handler.dart';
import '../../../../core/storage/secure_storage_service.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource =
  AuthRemoteDataSource();

  @override
  Future<void> sendOtp({
    required String phoneNumber,
  }) async {
    try {
      await _remoteDataSource.sendOtp(
        phoneNumber: phoneNumber,
      );
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    try {
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
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      final response =
      await _remoteDataSource.getCurrentUser();

      return UserModel.fromJson(
        response.data['data'],
      );
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _remoteDataSource.logout();

      await SecureStorageService.clearTokens();
    } catch (e) {
      throw ErrorHandler.handle(e);
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    final token =
    await SecureStorageService.getAccessToken();

    return token != null;
  }

  @override
  Future<String?> getAccessToken() async {
    return SecureStorageService.getAccessToken();
  }

  @override
  Future<String?> getRefreshToken() async {
    return SecureStorageService.getRefreshToken();
  }
}