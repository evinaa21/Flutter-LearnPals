// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnpal/main.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('Dashboard smoke test with new design', (
    WidgetTester tester,
  ) async {
    // Mock network images to prevent 404 errors in tests
    mockNetworkImagesFor(() async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const ProviderScope(child: LearnPalApp()));

      // Allow the widget tree to settle.
      await tester.pumpAndSettle();

      // Verify that the "A+ Mission Control" is present
      expect(find.text('A+ Mission Control'), findsOneWidget);
      expect(find.text('Your personalized path to success.'), findsOneWidget);

      // Verify the new Quick Actions section and its items
      expect(find.text('Quick Actions'), findsOneWidget);
      expect(find.text('Review Due'), findsOneWidget);
      expect(find.text('New Quiz'), findsOneWidget);
      expect(find.text('Create Card'), findsOneWidget);
      expect(find.text('Generate AI'), findsOneWidget);

      // Verify the "Continue Learning" section
      expect(find.text('Continue Learning'), findsOneWidget);

      // Verify that the old, removed widgets are NOT present
      expect(find.text('Leaderboard'), findsNothing);
      expect(find.text('Top Pick This Week!'), findsNothing);

      // Verify navigation bar is present
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Flashcards'), findsOneWidget);
      // Corrected: The label is 'Quiz', not 'Leaderboard'.
      expect(find.text('Quiz'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });
  });
}
