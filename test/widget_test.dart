import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';

void main() {
  testWidgets('Login Screen UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the login screen is displayed with the welcome text.
    expect(find.text('Hi, Welcome Back to Justduit'), findsOneWidget);

    // Verify the presence of email and password fields.
    expect(find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.hintText == 'Enter your email'), findsOneWidget);
    expect(find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.hintText == 'Enter your password'), findsOneWidget);

    // Verify the presence of the "Sign In Now" button.
    expect(find.text('Sign In Now'), findsOneWidget);

    // Verify the "Create New Account" button is present.
    expect(find.text('Create New Account'), findsOneWidget);
  });
}
