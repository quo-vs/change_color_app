import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:interview_sample_app/main.dart';

void main() {
  testWidgets('App widget tests', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Wait until starting animation finish
    await tester.pump(const Duration(seconds: 3));

    // Verify that screen contains expacted text.
    expect(find.text('Hey there'), findsOneWidget);

    expect(find.byType(Container), findsOneWidget);
    // Verify that initial screen color is white.
    expect((tester.firstWidget(find.byType(Container)) as Container).color, Colors.white);
    await tester.pump(const Duration(seconds: 3));

    // Tap on screen and change color
    await tester.tap(find.byType(InkWell));
    await tester.pump(const Duration(seconds: 3));

    // Verify that screen color was changed.
    expect((tester.firstWidget(find.byType(Container)) as Container).color != Colors.white, true);
  });
}
