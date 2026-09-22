// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:eniyan_clinic/app/app.dart';

void main() {
  testWidgets('shows splash, welcome, and home flow', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const EniyanClinicApp());

    expect(
      find.text('Nurturing little minds, inspiring bright futures'),
      findsOneWidget,
    );
    expect(find.text('Developed by ShaTechX'), findsOneWidget);
    expect(find.text('Welcome to Eniyan Clinic'), findsNothing);

    await tester.pump(const Duration(milliseconds: 1600));
    await tester.pump();

    expect(find.text('Welcome to Eniyan Clinic'), findsOneWidget);
    expect(find.text('Get started'), findsOneWidget);
    expect(find.text('Good morning,'), findsNothing);

    await tester.tap(find.text('Get started'));
    await tester.pumpAndSettle();

    expect(find.text('Good morning,'), findsOneWidget);
  });
}
