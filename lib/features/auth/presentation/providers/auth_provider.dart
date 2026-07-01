import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider =
StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState());

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

  Future<void> verifyOtp() async {
    state = state.copyWith(
      isVerifying: true,
    );

    // Temporary mock verification.
    // Later this will call the NestJS API.
    await Future.delayed(const Duration(seconds: 2));

    state = state.copyWith(
      isVerifying: false,
    );
  }

  void setLoading(bool value) {
    state = state.copyWith(
      isLoading: value,
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