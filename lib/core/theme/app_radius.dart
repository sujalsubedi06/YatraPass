import 'package:flutter/material.dart';

class AppRadius {
  AppRadius._();

  static const small = BorderRadius.all(
    Radius.circular(12),
  );

  static const medium = BorderRadius.all(
    Radius.circular(16),
  );

  static const large = BorderRadius.all(
    Radius.circular(20),
  );

  static const extraLarge = BorderRadius.all(
    Radius.circular(28),
  );

  static const pill = BorderRadius.all(
    Radius.circular(100),
  );
}