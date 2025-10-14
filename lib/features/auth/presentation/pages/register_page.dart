import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                key: const Key('register_email_field'),
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
                key: const Key('register_password_field'),
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
              const SizedBox(height: 12),
              TextFormField(
                key: const Key('register_confirm_password_field'),
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirmar contraseña',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Confirma tu contraseña';
                  if (value != _passwordController.text) return 'No coinciden';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                key: const Key('register_submit_button'),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Aquí posteriormente se integrará Firebase Auth
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Registro enviado')),
                    );
                  }
                },
                child: const Text('Crear cuenta'),
              ),
              TextButton(
                key: const Key('back_to_login_button'),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('¿Ya tienes cuenta? Inicia sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
