import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/app_page_header.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../providers/profile_provider.dart';
import '../../../../shared/widgets/onboarding_progress.dart';

class ProfileSetupPage extends ConsumerWidget {
  const ProfileSetupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(profileProvider.notifier);
    final state = ref.watch(profileProvider);

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: notifier.formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppSpacing.xl),

                const OnboardingProgress(
                  currentStep: 0,
                ),

                const AppPageHeader(
                  title: "Complete your profile",
                  subtitle:
                  "Almost done. Let's personalize your YatraPass account.",
                ),

                const SizedBox(height: AppSpacing.xxxl),

                AppTextField(
                  controller: notifier.firstNameController,
                  hint: "First Name",
                  onChanged: notifier.updateFirstName,
                ),

                const SizedBox(height: AppSpacing.md),

                AppTextField(
                  controller: notifier.lastNameController,
                  hint: "Last Name",
                  onChanged: notifier.updateLastName,
                ),

                const SizedBox(height: AppSpacing.md),

                AppTextField(
                  controller: notifier.emailController,
                  hint: "Email Address",
                  keyboardType: TextInputType.emailAddress,
                  onChanged: notifier.updateEmail,
                ),

                const SizedBox(height: AppSpacing.xxl),

                PrimaryButton(
                  text: "Continue",
                  icon: Icons.arrow_forward_rounded,
                  isLoading: state.isLoading,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}