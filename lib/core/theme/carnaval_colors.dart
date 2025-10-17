import 'package:flutter/material.dart';

/// Paleta de colores inspirada en el Carnaval de Negros y Blancos de Pasto
/// Utiliza colores vibrantes y festivos que representan la alegría del carnaval
class CarnavalColors {
  // Colores principales del carnaval
  static const amarillo = Color(0xFFFFC107);
  static const verde = Color(0xFF4CAF50);
  static const rojo = Color(0xFFF44336);
  static const azul = Color(0xFF2196F3);
  static const morado = Color(0xFF9C27B0);
  static const naranja = Color(0xFFFF9800);
  static const rosa = Color(0xFFE91E63);
  
  // Colores para negro y blanco (tema del carnaval)
  static const negro = Color(0xFF212121);
  static const blanco = Color(0xFFFAFAFA);
  
  // Gradientes temáticos
  static const gradientPrincipal = LinearGradient(
    colors: [morado, Color(0xFF673AB7), Color(0xFF512DA8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const gradientCarnaval = LinearGradient(
    colors: [amarillo, naranja, rojo],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const gradientNegros = LinearGradient(
    colors: [Color(0xFF424242), Color(0xFF212121), Color(0xFF000000)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  
  static const gradientBlancos = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFF5F5F5), Color(0xFFE0E0E0)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  
  static const gradientFiesta = LinearGradient(
    colors: [rosa, morado, azul],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Colores de fondo y tarjetas
  static const backgroundColor = Color(0xFFF5F5F5);
  static const cardBackground = Colors.white;
  static const textDark = Color(0xFF212121);
  static const textMedium = Color(0xFF424242);
  static const textLight = Color(0xFF757575);
  
  // Colores de acento
  static const accentGold = Color(0xFFFFD700);
  static const accentSilver = Color(0xFFC0C0C0);
}
