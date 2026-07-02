import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../shared/widgets/app_page_header.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../shared/widgets/onboarding_progress.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../providers/profile_provider.dart';

class ProfileSetupPage extends ConsumerWidget {
  const ProfileSetupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final notifier = ref.read(profileProvider.notifier);
    final state = ref.watch(profileProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Form(
          key: notifier.formKey,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.lg,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight - (AppSpacing.lg * 2),
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: AppSpacing.sm),

                        const OnboardingProgress(
                          currentStep: 0,
                        ),

                        const SizedBox(height: AppSpacing.xl),

                        const AppPageHeader(
                          title: "Complete your profile",
                          subtitle:
                          "Let's personalize your YatraPass account before we continue.",
                        ),

                        const SizedBox(height: AppSpacing.xxxl),

                        Container(
                          padding: const EdgeInsets.all(AppSpacing.lg),
                          decoration: BoxDecoration(
                            color: theme.cardColor,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: theme.dividerColor,
                            ),
                          ),
                          child: Column(
                            children: [
                              AppTextField(
                                controller:
                                notifier.firstNameController,
                                hint: "First Name",
                                textInputAction:
                                TextInputAction.next,
                                onChanged:
                                notifier.updateFirstName,
                              ),

                              const SizedBox(
                                height: AppSpacing.lg,
                              ),

                              AppTextField(
                                controller:
                                notifier.lastNameController,
                                hint: "Last Name",
                                textInputAction:
                                TextInputAction.next,
                                onChanged:
                                notifier.updateLastName,
                              ),

                              const SizedBox(
                                height: AppSpacing.lg,
                              ),

                              AppTextField(
                                controller:
                                notifier.emailController,
                                hint: "Email Address",
                                keyboardType:
                                TextInputType.emailAddress,
                                textInputAction:
                                TextInputAction.done,
                                onChanged:
                                notifier.updateEmail,
                              ),
                            ],
                          ),
                        ),

                        const Spacer(),

                        PrimaryButton(
                          text: "Continue",
                          icon: Icons.arrow_forward_rounded,
                          isLoading: state.isLoading,
                          onPressed: state.isValid
                              ? () async {
                            await notifier.continueSetup(
                              context,
                            );
                          }
                              : null,
                        ),

                        const SizedBox(height: AppSpacing.md),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}