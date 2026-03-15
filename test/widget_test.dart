import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:route_movies_app/main.dart';  // تأكد من استيراد MyApp بشكل صحيح

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Wait for the widget tree to settle
    await tester.pumpAndSettle();  // التأكد من أن كل الـ widgets تم تحميلها

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);  // تأكد من أن النص "0" موجود في الـ widget
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);  // تأكد من أن النص "1" ظهر بعد الضغط على الأيقونة
  });
}