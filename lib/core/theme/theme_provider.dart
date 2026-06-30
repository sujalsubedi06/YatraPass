import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider =
NotifierProvider<ThemeNotifier, ThemeMode>(ThemeNotifier.new);

class ThemeNotifier extends Notifier<ThemeMode> {
  static const _key = 'theme_mode';

  @override
  ThemeMode build() {
    _loadTheme();
    return ThemeMode.system;
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    final value = prefs.getString(_key);

    switch (value) {
      case 'light':
        state = ThemeMode.light;
        break;

      case 'dark':
        state = ThemeMode.dark;
        break;

      default:
        state = ThemeMode.system;
    }
  }

  Future<void> setTheme(ThemeMode mode) async {
    state = mode;

    final prefs = await SharedPreferences.getInstance();

    switch (mode) {
      case ThemeMode.light:
        await prefs.setString(_key, 'light');
        break;

      case ThemeMode.dark:
        await prefs.setString(_key, 'dark');
        break;

      case ThemeMode.system:
        await prefs.setString(_key, 'system');
        break;
    }
  }
}