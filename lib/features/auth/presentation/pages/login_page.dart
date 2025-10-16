import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/login_controller.dart';

/// Página de inicio de sesión
/// Usa Provider para acceder al LoginController compartido
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Llave para validar el formulario
  final _formKey = GlobalKey<FormState>();
  
  // Controladores para los campos de texto
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // Limpiamos los controladores cuando se destruye el widget
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Maneja el envío del formulario de login
  Future<void> _onSubmit() async {
    // Valida que el formulario sea correcto
    if (!(_formKey.currentState?.validate() ?? false)) return;
    
    // Accede al LoginController a través de Provider (sin escuchar cambios)
    final controller = context.read<LoginController>();
    
    // Llama al método submit del controller
    final ok = await controller.submit(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );
    
    // Verifica que el widget aún esté montado antes de mostrar mensajes
    if (!mounted) return;
    
    if (ok) {
      // Login exitoso
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('¡Bienvenido!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 1),
        ),
      );
      // Firebase ya inició sesión, el AuthWrapper detectará el cambio
      // y automáticamente navegará a HomePage
    } else if (controller.error != null) {
      // Muestra el error en un SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(controller.error!),
          backgroundColor: Colors.red,
        ),
      );
    }
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
              // Campo de correo electrónico
              TextFormField(
                key: const Key('login_email_field'),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  hintText: 'tu@correo.com',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Ingresa tu correo';
                  if (!value.contains('@')) return 'Correo inválido';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              
              // Campo de contraseña
              TextFormField(
                key: const Key('login_password_field'),
                controller: _passwordController,
                obscureText: true, // Oculta el texto
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Ingresa tu contraseña';
                  if (value.length < 6) return 'Mínimo 6 caracteres';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              
              // Botón de login con Consumer para escuchar cambios
              Consumer<LoginController>(
                builder: (context, controller, _) {
                  return ElevatedButton(
                    key: const Key('login_submit_button'),
                    onPressed: controller.isLoading ? null : _onSubmit,
                    child: controller.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Entrar'),
                  );
                },
              ),
              
              // Botón para ir a registro
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
