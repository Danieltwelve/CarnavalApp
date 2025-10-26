import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provider para manejar el estado del tema de la aplicación.
/// Permite cambiar entre modo claro, oscuro y sistema, con persistencia.
class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeProvider() {
    _loadThemeMode();
  }

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode {
    if (_themeMode == ThemeMode.system) {
      // En modo sistema, asumimos que es claro por defecto
      // (esto se puede mejorar detectando el tema del sistema)
      return false;
    }
    return _themeMode == ThemeMode.dark;
  }

  /// Alterna entre modo claro y oscuro
  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      setThemeMode(ThemeMode.dark);
    } else {
      setThemeMode(ThemeMode.light);
    }
  }

  /// Establece un modo de tema específico
  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
    _saveThemeMode(mode);
  }

  /// Carga el tema guardado desde SharedPreferences
  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt('themeMode') ?? 0;
    _themeMode = ThemeMode.values[themeIndex];
    notifyListeners();
  }

  /// Guarda el tema actual en SharedPreferences
  Future<void> _saveThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', mode.index);
  }
}
