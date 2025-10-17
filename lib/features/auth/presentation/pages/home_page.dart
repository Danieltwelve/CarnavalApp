import 'package:flutter/material.dart';
import '../../../carnaval/presentation/pages/carnaval_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Pantalla principal de la aplicación que sirve como punto de entrada.
/// Muestra la página principal del Carnaval y permite cerrar sesión.
class HomePage extends StatelessWidget {
  /// Constructor constante requerido para widgets sin estado
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior con título y botón para cerrar sesión en Firebase
      appBar: AppBar(
        title: const Text('Inicio'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Cerrar sesión',
            onPressed: () async {
              // Cierra la sesión del usuario en Firebase Authentication
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      // Cuerpo que muestra la página principal del Carnaval
      body: const CarnavalHomePage(),
    );
  }
}
