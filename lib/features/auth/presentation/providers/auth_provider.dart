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

  void setLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}

class AuthState {
  final String phone;
  final bool isValid;
  final bool isLoading;

  const AuthState({
    this.phone = '',
    this.isValid = false,
    this.isLoading = false,
  });

  AuthState copyWith({
    String? phone,
    bool? isValid,
    bool? isLoading,
  }) {
    return AuthState(
      phone: phone ?? this.phone,
      isValid: isValid ?? this.isValid,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}