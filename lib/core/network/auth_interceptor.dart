import 'package:dio/dio.dart';

import '../storage/secure_storage_service.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    final accessToken =
    await SecureStorageService.getAccessToken();

    if (accessToken != null &&
        accessToken.isNotEmpty) {
      options.headers['Authorization'] =
      'Bearer $accessToken';
    }

    return handler.next(options);
  }

  @override
  void onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) {
    return handler.next(err);
  }

  @override
  void onResponse(
      Response response,
      ResponseInterceptorHandler handler,
      ) {
    return handler.next(response);
  }
}