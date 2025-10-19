import 'package:flutter/foundation.dart';
import '../domain/app_user.dart';
import '../infrastructure/user_repository.dart';

/// Controller para manejar el estado del usuario actual
class UserController extends ChangeNotifier {
  final UserRepository _userRepo;
  AppUser? _currentUser;
  bool _loading = false;
  String? _error;

  UserController(this._userRepo);

  AppUser? get currentUser => _currentUser;
  bool get isLoading => _loading;
  String? get error => _error;
  bool get isAdmin => _currentUser?.isAdmin ?? false;
  bool get isVisitor => _currentUser?.isVisitor ?? true;

  /// Carga los datos del usuario desde Firestore
  Future<void> loadUser(String uid) async {
    _setLoading(true);
    _error = null;
    try {
      _currentUser = await _userRepo.getUser(uid);
      _setLoading(false);
    } catch (e) {
      _setError('Error al cargar usuario: $e');
      _setLoading(false);
    }
  }

  /// Actualiza el nombre del usuario
  Future<bool> updateDisplayName(String displayName) async {
    if (_currentUser == null) {
      _setError('No hay usuario cargado');
      return false;
    }

    _setLoading(true);
    try {
      await _userRepo.updateDisplayName(_currentUser!.uid, displayName);
      _currentUser = _currentUser!.copyWith(displayName: displayName);
      _setLoading(false);
      return true;
    } catch (e) {
      _setError('Error al actualizar nombre: $e');
      _setLoading(false);
      return false;
    }
  }

  /// Actualiza el rol del usuario (solo admin)
  Future<bool> updateUserRole(String uid, UserRole newRole) async {
    if (!isAdmin) {
      _setError('Solo administradores pueden cambiar roles');
      return false;
    }

    _setLoading(true);
    try {
      await _userRepo.updateUserRole(uid, newRole);
      // Si está actualizando su propio rol, actualizar el estado
      if (uid == _currentUser?.uid) {
        _currentUser = _currentUser!.copyWith(role: newRole);
      }
      _setLoading(false);
      return true;
    } catch (e) {
      _setError('Error al actualizar rol: $e');
      _setLoading(false);
      return false;
    }
  }

  /// Obtiene todos los usuarios (solo admin)
  Future<List<AppUser>> getAllUsers() async {
    if (!isAdmin) {
      _setError('Solo administradores pueden ver todos los usuarios');
      return [];
    }

    try {
      return await _userRepo.getAllUsers();
    } catch (e) {
      _setError('Error al obtener usuarios: $e');
      return [];
    }
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void _setError(String? value) {
    _error = value;
    notifyListeners();
  }

  /// Limpia el estado del usuario (al cerrar sesión)
  void clear() {
    _currentUser = null;
    _error = null;
    _loading = false;
    notifyListeners();
  }
}
