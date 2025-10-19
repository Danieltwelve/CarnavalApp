import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../carnaval/presentation/pages/carnaval_home_page.dart';
import '../../../user/domain/app_user.dart';
import '../../../user/infrastructure/user_repository.dart';

/// Pantalla principal de la aplicación que sirve como punto de entrada.
/// Muestra la página principal del Carnaval y permite cerrar sesión.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppUser? _currentUser;
  bool _isLoading = true;
  final _userRepository = UserRepository();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      try {
        final user = await _userRepository.getUser(userId);
        if (mounted) {
          setState(() {
            _currentUser = user;
            _isLoading = false;
          });
        }
      } catch (e) {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      // Barra superior con título y botón para cerrar sesión en Firebase
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Inicio'),
            if (_currentUser != null)
              Text(
                _currentUser!.isAdmin ? 'Administrador' : 'Visitante',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
          ],
        ),
        actions: [
          // Botón de cerrar sesión
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
      body: Column(
        children: [
          // Banner informativo con el rol del usuario
          if (_currentUser != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              color: _currentUser!.isAdmin
                  ? Colors.amber.shade100
                  : Colors.blue.shade50,
              child: Row(
                children: [
                  Icon(
                    _currentUser!.isAdmin
                        ? Icons.admin_panel_settings
                        : Icons.person,
                    color: _currentUser!.isAdmin
                        ? Colors.amber.shade900
                        : Colors.blue.shade900,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _currentUser!.isAdmin
                          ? 'Tienes permisos de administrador'
                          : 'Navegando como visitante',
                      style: TextStyle(
                        color: _currentUser!.isAdmin
                            ? Colors.amber.shade900
                            : Colors.blue.shade900,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          // Página principal del carnaval
          const Expanded(
            child: CarnavalHomePage(),
          ),
        ],
      ),
    );
  }
}
