import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/app_exception.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/auth_repository_impl.dart';

final authProvider =
StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());

  final _repository = AuthRepositoryImpl();

  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void updatePhone(String value) {
    state = state.copyWith(
      phone: value,
      isValid: value.length == 10,
      errorMessage: null,
    );
  }

  void updateOtp(String value) {
    state = state.copyWith(
      otp: value,
      errorMessage: null,
    );
  }

  Future<bool> sendOtp() async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
    );

    try {
      await _repository.sendOtp(
        phoneNumber: state.phone,
      );

      state = state.copyWith(
        isLoading: false,
      );

      return true;
    } on AppException catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.message,
      );

      return false;
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Something went wrong.',
      );

      return false;
    }
  }

  Future<bool> verifyOtp() async {
    state = state.copyWith(
      isVerifying: true,
      errorMessage: null,
    );

    try {
      await _repository.verifyOtp(
        phoneNumber: state.phone,
        otp: state.otp,
      );

      state = state.copyWith(
        isVerifying: false,
      );

      return true;
    } on AppException catch (e) {
      state = state.copyWith(
        isVerifying: false,
        errorMessage: e.message,
      );

      return false;
    } catch (_) {
      state = state.copyWith(
        isVerifying: false,
        errorMessage: 'Something went wrong.',
      );

      return false;
    }
  }

  Future<UserModel?> getCurrentUser() async {
    try {
      return await _repository.getCurrentUser();
    } on AppException catch (e) {
      state = state.copyWith(
        errorMessage: e.message,
      );

      return null;
    } catch (_) {
      state = state.copyWith(
        errorMessage: 'Something went wrong.',
      );

      return null;
    }
  }

  void clearError() {
    state = state.copyWith(
      errorMessage: null,
    );
  }

  void clearOtp() {
    state = state.copyWith(
      otp: '',
      errorMessage: null,
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}

class AuthState {
  final String phone;
  final String otp;

  final bool isValid;
  final bool isLoading;
  final bool isVerifying;

  final String? errorMessage;

  const AuthState({
    this.phone = '',
    this.otp = '',
    this.isValid = false,
    this.isLoading = false,
    this.isVerifying = false,
    this.errorMessage,
  });

  bool get isOtpValid => otp.length == 6;

  AuthState copyWith({
    String? phone,
    String? otp,
    bool? isValid,
    bool? isLoading,
    bool? isVerifying,
    String? errorMessage,
  }) {
    return AuthState(
      phone: phone ?? this.phone,
      otp: otp ?? this.otp,
      isValid: isValid ?? this.isValid,
      isLoading: isLoading ?? this.isLoading,
      isVerifying: isVerifying ?? this.isVerifying,
      errorMessage: errorMessage,
    );
  }
}