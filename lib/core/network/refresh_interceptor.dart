import 'package:dio/dio.dart';

import '../constants/api_constants.dart';
import '../storage/secure_storage_service.dart';
import 'api_client.dart';

class RefreshInterceptor extends Interceptor {
  bool _isRefreshing = false;

  @override
  Future<void> onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    if (_isRefreshing) {
      return handler.next(err);
    }

    _isRefreshing = true;

    try {
      final refreshToken =
      await SecureStorageService.getRefreshToken();

      if (refreshToken == null) {
        await SecureStorageService.clearTokens();
        return handler.next(err);
      }

      final response = await Dio().post(
        '${ApiConstants.baseUrl}${ApiConstants.refreshToken}',
        data: {
          'refreshToken': refreshToken,
        },
      );

      final accessToken =
      response.data['data']['accessToken'];

      final newRefreshToken =
      response.data['data']['refreshToken'];

      await SecureStorageService.saveTokens(
        accessToken: accessToken,
        refreshToken: newRefreshToken,
      );

      final options = err.requestOptions;

      options.headers['Authorization'] =
      'Bearer $accessToken';

      final retryResponse =
      await ApiClient.dio.fetch(options);

      _isRefreshing = false;

      return handler.resolve(retryResponse);
    } catch (_) {
      _isRefreshing = false;

      await SecureStorageService.clearTokens();

      return handler.next(err);
    }
  }
}