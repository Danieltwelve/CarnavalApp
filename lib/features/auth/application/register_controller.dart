import 'package:flutter/foundation.dart';

import '../domain/auth_repository.dart';

class RegisterController extends ChangeNotifier {
  final AuthRepository _repo;
  bool _loading = false;
  String? _error;

  RegisterController(this._repo);

  bool get isLoading => _loading;
  String? get error => _error;

  Future<bool> submit({required String email, required String password}) async {
    _set(loading: true, error: null);
    try {
      await _repo.signUp(email: email, password: password);
      _set(loading: false, error: null);
      return true;
    } catch (e) {
      _set(loading: false, error: e.toString());
      return false;
    }
  }

  void _set({bool? loading, String? error}) {
    if (loading != null) _loading = loading;
    _error = error;
    notifyListeners();
  }
}
