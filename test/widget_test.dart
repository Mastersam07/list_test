import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:list_test/main.dart';

void main() {
  group('MyHomePage', () {
    testWidgets('should display groups for each unique starting letter',
        (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final uniqueStartingLetters = sampleNames.map((name) => name[0]).toSet();

      for (var letter in uniqueStartingLetters) {
        while (tester.widgetList(find.text(letter)).isEmpty) {
          // Scroll a bit to reveal more items
          await tester.drag(find.byType(ListView).first, const Offset(0, -300));
          await tester.pumpAndSettle();
        }
        expect(find.text(letter), findsOneWidget);
      }
    });

    testWidgets('should display names within a sample group', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      // Check a sample group, e.g., names starting with 'A'
      final sampleGroupNames =
          sampleNames.where((name) => name.startsWith('A')).toList();

      for (var name in sampleGroupNames) {
        expect(find.text(name, skipOffstage: false), findsOneWidget);
      }
    });
  });
}
