import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const PhoneNumberField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TextFormField(
      controller: controller,
      autofocus: true,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      maxLength: 10,
      onChanged: onChanged,
      style: theme.textTheme.titleMedium,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      validator: (value) {
        final phone = value?.trim() ?? '';

        if (phone.isEmpty) {
          return 'Please enter your mobile number';
        }

        if (!RegExp(r'^(98|97|96)\d{8}$').hasMatch(phone)) {
          return 'Enter a valid Nepal mobile number';
        }

        return null;
      },
      decoration: InputDecoration(
        counterText: '',
        hintText: '98XXXXXXXX',

        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '🇳🇵',
                style: TextStyle(fontSize: 22),
              ),

              const SizedBox(width: 10),

              Text(
                '+977',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(width: 12),

              Container(
                width: 1,
                height: 24,
                color: colorScheme.outline,
              ),
            ],
          ),
        ),

        prefixIconConstraints: const BoxConstraints(
          minWidth: 120,
        ),

        filled: true,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: colorScheme.outline,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: 2,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: colorScheme.error,
          ),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: colorScheme.error,
            width: 2,
          ),
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
      ),
    );
  }
}