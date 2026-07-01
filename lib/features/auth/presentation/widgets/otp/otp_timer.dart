import 'dart:async';

import 'package:flutter/material.dart';

class OtpTimer extends StatefulWidget {
  final VoidCallback onResend;

  const OtpTimer({
    super.key,
    required this.onResend,
  });

  @override
  State<OtpTimer> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  static const int _initialSeconds = 60;

  late int _secondsRemaining;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _secondsRemaining = _initialSeconds;

    _timer?.cancel();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (!mounted) return;

        if (_secondsRemaining > 0) {
          setState(() {
            _secondsRemaining--;
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  void _resend() {
    widget.onResend();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (_secondsRemaining == 0) {
      return Center(
        child: TextButton(
          onPressed: _resend,
          child: const Text('Resend Code'),
        ),
      );
    }

    final minutes = (_secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final seconds = (_secondsRemaining % 60).toString().padLeft(2, '0');

    return Center(
      child: Text(
        'Resend code in $minutes:$seconds',
        style: theme.textTheme.bodyMedium,
      ),
    );
  }
}