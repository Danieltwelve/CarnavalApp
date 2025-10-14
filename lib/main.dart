import 'package:flutter/material.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 240), // color de fondo
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                " Bienvenido al Carnaval de negros y blancos ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 10, 10, 10),
                ),
              ),
              const SizedBox(height: 32),
              FilledButton(
                key: const Key('go_to_login_from_welcome'),
                onPressed: () => Navigator.of(context).pushNamed('/login'),
                child: const Text('Iniciar sesión'),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                key: const Key('go_to_register_from_welcome'),
                onPressed: () => Navigator.of(context).pushNamed('/register'),
                child: const Text('Crear cuenta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

