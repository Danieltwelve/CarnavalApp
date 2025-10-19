import 'package:firebase_auth/firebase_auth.dart';
import '../domain/auth_repository.dart';
import '../../user/infrastructure/user_repository.dart';
import '../../user/domain/app_user.dart';

/// Implementación de autenticación usando Firebase
/// Esta clase conecta con los servicios de Firebase Authentication
class FirebaseAuthRepository implements AuthRepository {
  // Instancia de FirebaseAuth que nos da acceso a todos los métodos de autenticación
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserRepository _userRepo = UserRepository();

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
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Crear documento en Firestore con el rol de visitor por defecto
      if (credential.user != null) {
        await _userRepo.createUser(
          uid: credential.user!.uid,
          email: email,
          role: UserRole.visitor, // Por defecto todos son visitantes
        );
      }
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

  /// Obtiene el usuario actual con su rol desde Firestore
  Future<AppUser?> getCurrentUser() async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser == null) return null;

    return await _userRepo.getUser(firebaseUser.uid);
  }

  /// Stream del usuario actual con rol
  Stream<AppUser?> get currentUserStream {
    return _auth.authStateChanges().asyncExpand((firebaseUser) async* {
      if (firebaseUser == null) {
        yield null;
      } else {
        yield await _userRepo.getUser(firebaseUser.uid);
      }
    });
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
