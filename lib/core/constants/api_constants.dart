class ApiConstants {
  ApiConstants._();

  // ==========================
  // Base URL
  // ==========================

  // Android Emulator
  // static const String baseUrl = 'http://10.0.2.2:3000/api';

  // iOS Simulator
  // static const String baseUrl = 'http://localhost:3000/api';

  // Physical Device (replace with your PC IP)
  // static const String baseUrl = 'http://192.168.1.100:3000/api';

  // Linux / Windows / macOS Desktop
  static const String baseUrl = 'http://192.168.0.120:3000/api';

  // ==========================
  // Auth
  // ==========================

  static const String sendOtp = '/auth/send-otp';

  static const String verifyOtp = '/auth/verify-otp';

  static const String refreshToken = '/auth/refresh';

  static const String logout = '/auth/logout';

  static const String me = '/auth/me';
}