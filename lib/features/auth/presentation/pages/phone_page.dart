import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
                          onPressed: authState.isValid
                              ? () {
                            context.go('/otp');
                          }
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