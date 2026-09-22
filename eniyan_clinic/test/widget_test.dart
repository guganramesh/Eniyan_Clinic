// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:eniyan_clinic/app/app.dart';
import 'package:eniyan_clinic/features/auth/presentation/pages/registration_page.dart';

void main() {
  testWidgets('shows splash, welcome, login, and home flow', (
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

    expect(
      find.text('A little more care for every little one.'),
      findsOneWidget,
    );
    expect(find.text('Get Started'), findsOneWidget);
    expect(find.text('Trusted care for growing families'), findsOneWidget);
    expect(find.text('Good morning,'), findsNothing);

    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.text('Log in'), findsOneWidget);

    await tester.enterText(
      find.byType(TextFormField).at(0),
      'parent@example.com',
    );
    await tester.enterText(find.byType(TextFormField).at(1), 'password');
    await tester.tap(find.text('Log in'));
    await tester.pumpAndSettle();

    expect(find.text('Good Morning 👋'), findsOneWidget);
    expect(find.text('Welcome to Eniyan Clinics'), findsOneWidget);
    expect(find.text('Appointments'), findsOneWidget);
    expect(find.text('Facilities'), findsOneWidget);
    expect(find.text('Blog'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });

  testWidgets('registers a new family account', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: RegistrationPage()));

    expect(find.text('Create your account'), findsOneWidget);
    expect(find.text('Create account'), findsOneWidget);

    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'Ravi Kumar');
    await tester.enterText(fields.at(1), 'ravi@example.com');
    await tester.enterText(fields.at(2), 'password');
    await tester.enterText(fields.at(3), 'password');
    await tester.ensureVisible(find.byType(CheckboxListTile));
    await tester.tap(find.byType(CheckboxListTile));
    await tester.ensureVisible(find.text('Create account'));
    await tester.tap(find.text('Create account'));
    await tester.pumpAndSettle();

    expect(find.text('Good Morning 👋'), findsOneWidget);
  });
}
