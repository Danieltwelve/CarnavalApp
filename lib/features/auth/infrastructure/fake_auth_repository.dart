import 'dart:async';

import '../domain/auth_repository.dart';

class FakeAuthRepository implements AuthRepository {
  @override
  Future<void> signIn({required String email, required String password}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (!email.contains('@') || password.length < 6) {
      throw Exception('Credenciales inválidas');
    }
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    await Future.delayed(const Duration(milliseconds: 700));
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 200));
  }
}
