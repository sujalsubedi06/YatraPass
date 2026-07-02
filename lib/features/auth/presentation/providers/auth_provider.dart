import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    );
  }

  void updateOtp(String value) {
    state = state.copyWith(
      otp: value,
    );
  }

  Future<void> sendOtp() async {
    state = state.copyWith(
      isLoading: true,
    );

    try {
      await _repository.sendOtp(
        phoneNumber: state.phone,
      );

      state = state.copyWith(
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
      );

      rethrow;
    }
  }

  Future<void> verifyOtp() async {
    state = state.copyWith(
      isVerifying: true,
    );

    try {
      await _repository.verifyOtp(
        phoneNumber: state.phone,
        otp: state.otp,
      );

      state = state.copyWith(
        isVerifying: false,
      );
    } catch (e) {
      state = state.copyWith(
        isVerifying: false,
      );

      rethrow;
    }
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

  const AuthState({
    this.phone = '',
    this.otp = '',
    this.isValid = false,
    this.isLoading = false,
    this.isVerifying = false,
  });

  AuthState copyWith({
    String? phone,
    String? otp,
    bool? isValid,
    bool? isLoading,
    bool? isVerifying,
  }) {
    return AuthState(
      phone: phone ?? this.phone,
      otp: otp ?? this.otp,
      isValid: isValid ?? this.isValid,
      isLoading: isLoading ?? this.isLoading,
      isVerifying: isVerifying ?? this.isVerifying,
    );
  }
}