import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/app_user.dart';

/// Repositorio para manejar operaciones de usuarios en Firestore
class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Referencia a la colección de usuarios
  CollectionReference get _usersCollection => _firestore.collection('users');

  /// Crea un nuevo usuario en Firestore después del registro
  Future<void> createUser({
    required String uid,
    required String email,
    UserRole role = UserRole.visitor, // Por defecto visitor
    String? displayName,
  }) async {
    final user = AppUser(
      uid: uid,
      email: email,
      role: role,
      displayName: displayName,
      createdAt: DateTime.now(),
    );

    await _usersCollection.doc(uid).set(user.toFirestore());
  }

  /// Obtiene los datos del usuario desde Firestore
  Future<AppUser?> getUser(String uid) async {
    try {
      final doc = await _usersCollection.doc(uid).get();
      if (!doc.exists) return null;
      return AppUser.fromFirestore(doc);
    } catch (e) {
      throw Exception('Error al obtener usuario: $e');
    }
  }

  /// Stream que escucha cambios en los datos del usuario
  Stream<AppUser?> userStream(String uid) {
    return _usersCollection.doc(uid).snapshots().map((doc) {
      if (!doc.exists) return null;
      return AppUser.fromFirestore(doc);
    });
  }

  /// Actualiza el rol del usuario (solo admin puede hacer esto)
  Future<void> updateUserRole(String uid, UserRole newRole) async {
    await _usersCollection.doc(uid).update({'role': newRole.value});
  }

  /// Actualiza el nombre del usuario
  Future<void> updateDisplayName(String uid, String displayName) async {
    await _usersCollection.doc(uid).update({'displayName': displayName});
  }

  /// Obtiene todos los usuarios (solo para admin)
  Future<List<AppUser>> getAllUsers() async {
    final snapshot = await _usersCollection.get();
    return snapshot.docs.map((doc) => AppUser.fromFirestore(doc)).toList();
  }

  /// Elimina un usuario de Firestore
  Future<void> deleteUser(String uid) async {
    await _usersCollection.doc(uid).delete();
  }

  /// Verifica si un usuario existe
  Future<bool> userExists(String uid) async {
    final doc = await _usersCollection.doc(uid).get();
    return doc.exists;
  }
}
