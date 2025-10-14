import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                key: const Key('login_email_field'),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  hintText: 'tu@correo.com',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Ingresa tu correo';
                  if (!value.contains('@')) return 'Correo inválido';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                key: const Key('login_password_field'),
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Ingresa tu contraseña';
                  if (value.length < 6) return 'Mínimo 6 caracteres';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                key: const Key('login_submit_button'),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Aquí posteriormente se integrará Firebase Auth
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login enviado')),
                    );
                  }
                },
                child: const Text('Entrar'),
              ),
              TextButton(
                key: const Key('go_to_register_button'),
                onPressed: () => Navigator.of(context).pushNamed('/register'),
                child: const Text('¿No tienes cuenta? Regístrate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
