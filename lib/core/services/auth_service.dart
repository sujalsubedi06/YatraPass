import '../../features/auth/data/models/user_model.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';

class AuthService {
  AuthService._();

  static final AuthRepositoryImpl _repository =
  AuthRepositoryImpl();

  static Future<bool> isLoggedIn() async {
    return _repository.isLoggedIn();
  }

  static Future<UserModel> getCurrentUser() async {
    return _repository.getCurrentUser();
  }

  static Future<void> logout() async {
    await _repository.logout();
  }

  static Future<String?> getAccessToken() async {
    return _repository.getAccessToken();
  }

  static Future<String?> getRefreshToken() async {
    return _repository.getRefreshToken();
  }
}