import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/primary_button.dart';
import '../providers/auth_provider.dart';
import '../widgets/otp/otp_field.dart';
import '../widgets/otp/otp_timer.dart';

class OtpPage extends ConsumerWidget {
  final String phoneNumber;

  const OtpPage({
    super.key,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final authState = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: SafeArea(
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
                      Text(
                        'Verify your number',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        'Enter the 6-digit verification code sent to',
                        style: theme.textTheme.bodyLarge,
                      ),

                      const SizedBox(height: 8),

                      Text(
                        '+977 $phoneNumber',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 40),

                      OtpField(
                        onCompleted: (otp) {
                          authNotifier.updateOtp(otp);
                        },
                      ),

                      const SizedBox(height: 32),

                      OtpTimer(
                        onResend: () {
                          debugPrint('Resend OTP');
                          // TODO: Connect resend OTP endpoint
                        },
                      ),

                      const Spacer(),

                      PrimaryButton(
                        text: authState.isVerifying
                            ? 'Verifying...'
                            : 'Verify',
                        isLoading: authState.isVerifying,
                        onPressed: authState.isVerifying
                            ? null
                            : () async {
                          try {
                            await authNotifier.verifyOtp();

                            if (!context.mounted) return;

                            context.go('/home');
                          } catch (e) {
                            if (!context.mounted) return;

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  e.toString(),
                                ),
                              ),
                            );
                          }
                        },
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}