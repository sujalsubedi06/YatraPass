import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpField extends StatelessWidget {
  final ValueChanged<String>? onCompleted;

  const OtpField({
    super.key,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline,
        ),
      ),
    );

    return Center(
      child: Pinput(
        length: 6,
        autofocus: true,

        defaultPinTheme: defaultPinTheme,

        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colorScheme.primary,
              width: 2,
            ),
          ),
        ),

        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colorScheme.primary,
            ),
          ),
        ),

        errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: colorScheme.errorContainer,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colorScheme.error,
            ),
          ),
        ),

        onCompleted: (pin) {
          onCompleted?.call(pin);
        },
      ),
    );
  }
}