import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    state = state.copyWith(firstName: value);
  }

  void updateLastName(String value) {
    state = state.copyWith(lastName: value);
  }

  void updateEmail(String value) {
    state = state.copyWith(email: value);
  }

  Future<void> saveProfile() async {
    state = state.copyWith(isLoading: true);

    // API integration comes later
    await Future.delayed(const Duration(milliseconds: 800));

    state = state.copyWith(isLoading: false);
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

  const ProfileState({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.isLoading = false,
  });

  ProfileState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    bool? isLoading,
  }) {
    return ProfileState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}