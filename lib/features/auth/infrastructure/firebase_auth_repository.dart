import 'package:firebase_auth/firebase_auth.dart';
import '../domain/auth_repository.dart';

/// Implementación de autenticación usando Firebase
/// Esta clase conecta con los servicios de Firebase Authentication
class FirebaseAuthRepository implements AuthRepository {
  // Instancia de FirebaseAuth que nos da acceso a todos los métodos de autenticación
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Inicia sesión con correo y contraseña
  /// Lanza excepciones con mensajes 
  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      // Llamada a Firebase para autenticar al usuario
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Si llega aquí, el login fue exitoso
    } on FirebaseAuthException catch (e) {
      // Capturamos errores específicos de Firebase y los traducimos
      throw _handleAuthException(e);
    }
  }

  /// Registra un nuevo usuario con correo y contraseña
  /// Firebase automáticamente inicia sesión después de crear la cuenta
  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      // Crea una nueva cuenta en Firebase
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Usuario creado exitosamente
    } on FirebaseAuthException catch (e) {
      // Capturamos errores y los traducimos
      throw _handleAuthException(e);
    }
  }

  /// Cierra la sesión del usuario actual
  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  /// Traduce los códigos de error de Firebase a mensajes en español
  /// Esto hace que los errores sean más amigables para el usuario
  String _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No existe una cuenta con este correo';
      case 'wrong-password':
        return 'Contraseña incorrecta';
      case 'email-already-in-use':
        return 'Este correo ya está registrado';
      case 'weak-password':
        return 'La contraseña es muy débil (mínimo 6 caracteres)';
      case 'invalid-email':
        return 'Correo electrónico inválido';
      case 'invalid-credential':
        return 'Credenciales inválidas. Verifica tu correo y contraseña';
      case 'too-many-requests':
        return 'Demasiados intentos. Intenta más tarde';
      default:
        return 'Error de autenticación: ${e.message ?? e.code}';
    }
  }
}
