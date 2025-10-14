import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:carnaval_app/main.dart';

void main() {
  testWidgets('Navega de bienvenida a login y registro', (tester) async {
    await tester.pumpWidget(const MyApp());

    // Botones presentes
    expect(find.byKey(const Key('go_to_login_from_welcome')), findsOneWidget);
    expect(find.byKey(const Key('go_to_register_from_welcome')), findsOneWidget);

    // Ir a Login
    await tester.tap(find.byKey(const Key('go_to_login_from_welcome')));
    await tester.pumpAndSettle();
    expect(find.text('Iniciar sesión'), findsOneWidget);

    // Desde Login ir a Registro
    await tester.tap(find.byKey(const Key('go_to_register_button')));
    await tester.pumpAndSettle();
    expect(find.text('Registro'), findsOneWidget);

    // Volver a Login
    await tester.tap(find.byKey(const Key('back_to_login_button')));
    await tester.pumpAndSettle();
    expect(find.text('Iniciar sesión'), findsOneWidget);
  });
}
