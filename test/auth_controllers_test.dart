import 'package:flutter_test/flutter_test.dart';

import 'package:carnaval_app/features/auth/application/login_controller.dart';
import 'package:carnaval_app/features/auth/application/register_controller.dart';
import 'package:carnaval_app/features/auth/infrastructure/fake_auth_repository.dart';

void main() {
  test('LoginController happy path sets loading then success', () async {
    final c = LoginController(FakeAuthRepository());
    expect(c.isLoading, isFalse);
    final f = c.submit(email: 'a@b.com', password: '123456');
    expect(c.isLoading, isTrue);
    final ok = await f;
    expect(ok, isTrue);
    expect(c.isLoading, isFalse);
    expect(c.error, isNull);
  });

  test('LoginController error path sets error', () async {
    final c = LoginController(FakeAuthRepository());
    final ok = await c.submit(email: 'sin-arroba', password: '123');
    expect(ok, isFalse);
    expect(c.isLoading, isFalse);
    expect(c.error, isNotNull);
  });

  test('RegisterController happy path', () async {
    final c = RegisterController(FakeAuthRepository());
    final ok = await c.submit(email: 'a@b.com', password: '123456');
    expect(ok, isTrue);
    expect(c.error, isNull);
  });
}
