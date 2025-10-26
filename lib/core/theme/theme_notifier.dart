import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Notificador global del tema de la aplicación
/// Cualquier widget puede acceder y cambiar el tema
class ThemeNotifier extends ValueNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light) {
    _loadTheme();
  }

  // Cargar tema guardado
  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedIndex = prefs.getInt('themeMode');
    
    if (savedIndex != null) {
      print('📱 Tema cargado desde SharedPreferences: ${ThemeMode.values[savedIndex]}');
      value = ThemeMode.values[savedIndex];
    } else {
      print('📱 No hay tema guardado, usando light por defecto');
    }
  }

  // Alternar entre claro y oscuro
  Future<void> toggle() async {
    print('🎨 Alternando tema desde: $value');
    
    // Alterna entre dark y light
    if (value == ThemeMode.dark) {
      value = ThemeMode.light;
    } else {
      value = ThemeMode.dark;
    }
    
    print('🎨 Nuevo tema: $value');
    
    // Guardar preferencia
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', value.index);
  }
}

// Instancia global única
final themeNotifier = ThemeNotifier();
