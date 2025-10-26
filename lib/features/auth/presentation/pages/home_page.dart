import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../carnaval/presentation/pages/carnaval_home_page.dart';
import '../../../user/domain/app_user.dart';
import '../../../user/infrastructure/user_repository.dart';
import '../../../../core/theme/theme_notifier.dart';

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

  void _toggleTheme() {
    // Simplemente llama al notificador global
    themeNotifier.toggle();
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
        title: const Text('Inicio'),
        // Subtítulo con el rol del usuario
        bottom: _currentUser != null
            ? PreferredSize(
                preferredSize: const Size.fromHeight(24),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 16, bottom: 6),
                  child: Text(
                    _currentUser!.isAdmin ? 'Administrador' : 'Visitante',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ),
              )
            : null,
        actions: [
          // Botón para cambiar tema
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            tooltip: 'Cambiar tema',
            onPressed: _toggleTheme,
          ),
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
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.secondaryContainer,
              child: Row(
                children: [
                  Icon(
                    _currentUser!.isAdmin
                        ? Icons.admin_panel_settings
                        : Icons.person,
                    color: _currentUser!.isAdmin
                        ? Theme.of(context).colorScheme.onPrimaryContainer
                        : Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _currentUser!.isAdmin
                          ? 'Tienes permisos de administrador'
                          : 'Navegando como visitante',
                      style: TextStyle(
                        color: _currentUser!.isAdmin
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : Theme.of(context).colorScheme.onSecondaryContainer,
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
