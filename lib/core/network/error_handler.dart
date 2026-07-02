import 'package:dio/dio.dart';

import 'app_exception.dart';

class ErrorHandler {
  static AppException handle(dynamic error) {
    if (error is DioException) {
      // No Internet
      if (error.type == DioExceptionType.connectionError) {
        return const AppException(
          'No internet connection.',
        );
      }

      // Timeout
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        return const AppException(
          'Request timed out. Please try again.',
        );
      }

      final data = error.response?.data;

      if (data is Map<String, dynamic>) {
        final message = data['message'];

        // Handles:
        // "message": "Invalid OTP"
        if (message is String) {
          return AppException(message);
        }

        // Handles:
        // "message": ["Phone number invalid"]
        if (message is List && message.isNotEmpty) {
          return AppException(
            message.first.toString(),
          );
        }
      }

      return const AppException(
        'Something went wrong.',
      );
    }

    return const AppException(
      'Unexpected error occurred.',
    );
  }
}