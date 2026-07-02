import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../providers/auth_provider.dart';
import '../widgets/phone/auth_header.dart';
import '../widgets/phone/phone_number_field.dart';
import '../widgets/phone/terms_text.dart';

class PhonePage extends ConsumerWidget {
  const PhonePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);

    Future<void> sendOtp() async {
      final success = await authNotifier.sendOtp();

      if (!context.mounted) return;

      if (!success) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(
                authState.errorMessage ?? 'Something went wrong.',
              ),
            ),
          );

        authNotifier.clearError();
        return;
      }

      context.go(
        AppRoutes.otp,
        extra: authState.phone,
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Form(
          key: authNotifier.formKey,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight - 48,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AuthHeader(),

                        const SizedBox(height: 40),

                        PhoneNumberField(
                          controller: authNotifier.phoneController,
                          onChanged: authNotifier.updatePhone,
                        ),

                        const Spacer(),

                        PrimaryButton(
                          text: 'Continue',
                          isLoading: authState.isLoading,
                          onPressed: authState.isValid &&
                              !authState.isLoading
                              ? sendOtp
                              : null,
                        ),

                        const SizedBox(height: 20),

                        const TermsText(),

                        const SizedBox(height: 16),
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