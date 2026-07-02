import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';

final profileProvider =
StateNotifierProvider<ProfileNotifier, ProfileState>(
      (ref) => ProfileNotifier(),
);

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier() : super(const ProfileState());

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void updateFirstName(String value) {
    state = state.copyWith(
      firstName: value,
      isValid: _validate(
        firstName: value,
        lastName: state.lastName,
        email: state.email,
      ),
    );
  }

  void updateLastName(String value) {
    state = state.copyWith(
      lastName: value,
      isValid: _validate(
        firstName: state.firstName,
        lastName: value,
        email: state.email,
      ),
    );
  }

  void updateEmail(String value) {
    state = state.copyWith(
      email: value,
      isValid: _validate(
        firstName: state.firstName,
        lastName: state.lastName,
        email: value,
      ),
    );
  }

  bool _validate({
    required String firstName,
    required String lastName,
    required String email,
  }) {
    final emailRegex = RegExp(
      r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    return firstName.trim().isNotEmpty &&
        lastName.trim().isNotEmpty &&
        emailRegex.hasMatch(email.trim());
  }

  Future<void> continueSetup(BuildContext context) async {
    if (!state.isValid) return;

    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
    );

    try {
      // TODO: Save profile through API

      await Future.delayed(
        const Duration(milliseconds: 800),
      );

      if (!context.mounted) return;

      context.go(AppRoutes.emailVerification);
    } catch (_) {
      state = state.copyWith(
        errorMessage: 'Unable to continue. Please try again.',
      );
    }

    state = state.copyWith(
      isLoading: false,
    );
  }

  void clearError() {
    state = state.copyWith(
      errorMessage: null,
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}

class ProfileState {
  final String firstName;
  final String lastName;
  final String email;

  final bool isLoading;
  final bool isValid;

  final String? errorMessage;

  const ProfileState({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.isLoading = false,
    this.isValid = false,
    this.errorMessage,
  });

  ProfileState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    bool? isLoading,
    bool? isValid,
    String? errorMessage,
  }) {
    return ProfileState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      isLoading: isLoading ?? this.isLoading,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage,
    );
  }
}