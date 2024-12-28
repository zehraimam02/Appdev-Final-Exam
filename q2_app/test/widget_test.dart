// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:q2_app/expense_screen.dart';

import 'package:q2_app/main.dart';

void main() {
  testWidgets('Weekly Expense Golden Test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const WeeklyExpense(),
      ),
    );

    // Wait for any animations to complete
    await tester.pumpAndSettle();

    // Take the screenshot
    await expectLater(
      find.byType(WeeklyExpense),
      matchesGoldenFile('ui_sc.dart.png'),
    );
  });
}