import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Importamos el AuthWrapper que maneja la autenticación
import 'widgets/auth_wrapper.dart';

// Importamos las páginas
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/register_page.dart';
import 'features/auth/presentation/pages/home_page.dart';

// Importamos los controllers
import 'features/auth/application/login_controller.dart';
import 'features/auth/application/register_controller.dart';

// Importamos el repository de Firebase (la implementación real)
import 'features/auth/infrastructure/firebase_auth_repository.dart';

/// Punto de entrada de la aplicación
Future<void> main() async {
  // Inicializa los bindings de Flutter antes de usar plugins
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializa Firebase con las opciones configuradas
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Creamos UNA SOLA instancia del repository que usarán todos los controllers
    final authRepo = FirebaseAuthRepository();

    return MultiProvider(
      // Proveemos los controllers a toda la app
      providers: [
        // LoginController disponible en toda la app
        ChangeNotifierProvider(
          create: (_) => LoginController(authRepo),
        ),
        // RegisterController disponible en toda la app
        ChangeNotifierProvider(
          create: (_) => RegisterController(authRepo),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Carnaval App',
        
        // La ruta inicial ahora es AuthWrapper
        // que decide automáticamente si mostrar Welcome o Home
        home: const AuthWrapper(),
        
        // Rutas nombradas para navegación
        routes: {
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/home': (context) => const HomePage(),
        },
        
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
        ),
      ),
    );
  }
}

