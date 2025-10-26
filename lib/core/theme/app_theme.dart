import 'package:flutter/material.dart';

/// Definiciones de temas para la aplicación.
class AppTheme {
  // Tema claro
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.white,
    cardTheme: CardThemeData(
      elevation: 2,
      color: Colors.white,
      surfaceTintColor: Colors.purple.shade50,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      elevation: 0,
    ),
  );

  // Tema oscuro
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    cardTheme: const CardThemeData(
      elevation: 2,
      color: Color(0xFF2C2C2C),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      elevation: 0,
    ),
  );
}
