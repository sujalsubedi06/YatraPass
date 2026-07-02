import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/api_client.dart';

class AuthRemoteDataSource {
  final Dio _dio = ApiClient.dio;

  Future<Response> sendOtp({
    required String phoneNumber,
  }) async {
    return await _dio.post(
      ApiConstants.sendOtp,
      data: {
        'phoneNumber': phoneNumber,
      },
    );
  }

  Future<Response> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    return await _dio.post(
      ApiConstants.verifyOtp,
      data: {
        'phoneNumber': phoneNumber,
        'otp': otp,
      },
    );
  }

  Future<Response> refreshToken({
    required String refreshToken,
  }) async {
    return await _dio.post(
      ApiConstants.refreshToken,
      data: {
        'refreshToken': refreshToken,
      },
    );
  }

  Future<Response> logout() async {
    return await _dio.post(
      ApiConstants.logout,
    );
  }

  Future<Response> getCurrentUser() async {
    return await _dio.get(
      ApiConstants.me,
    );
  }
}