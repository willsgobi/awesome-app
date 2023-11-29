import 'package:awesome_app/src/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('test in LoginPage', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    expect(find.text('Usuário'), findsOneWidget);
    expect(find.text("Senha"), findsOneWidget);

    expect(find.text("Política de Privacidade"), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, "Entrar"), findsOne);

    await tester.tap(find.widgetWithText(ElevatedButton, "Entrar"));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text("O campo deve ser preenchido!"), findsNothing);
  });
}
