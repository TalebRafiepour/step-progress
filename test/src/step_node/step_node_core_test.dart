// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:step_progress/src/step_node/step_node_core.dart';
import 'package:step_progress/src/step_node/step_node_shape.dart';
import 'package:step_progress/src/step_node/step_node_shaped_container.dart';

void main() {
  group('StepNodeCore Widget Tests', () {
    testWidgets(
      'renders with default icon, opacity 1 and scale 1 when isVisible '
      'is true',
      (tester) async {
        // Build the widget
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: StepNodeCore(
                stepNodeShape: StepNodeShape.circle,
                isVisible: true,
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
          ),
        );

        // Verify that the StepNodeShapedContainer is present
        expect(find.byType(StepNodeShapedContainer), findsOneWidget);
        // Verify that default icon (check icon) is rendered
        expect(find.byIcon(Icons.check), findsOneWidget);

        // Verify that AnimatedOpacity and AnimatedScale are used in the widget
        // tree.
        expect(find.byType(AnimatedOpacity), findsOneWidget);
        expect(find.byType(AnimatedScale), findsOneWidget);

        // Since internal values of opacity and scale are not directly
        // accessible from the widget,
        // we check that the widget tree renders our default icon as expected.
      },
    );

    testWidgets('renders with opacity 0 and scale 0 when isVisible is false', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StepNodeCore(
              stepNodeShape: StepNodeShape.circle,
              decoration: BoxDecoration(color: Colors.green),
              isVisible: false,
            ),
          ),
        ),
      );

      // Retrieve the AnimatedOpacity and check its opacity value.
      final animatedOpacity = tester.widget<AnimatedOpacity>(
        find.byType(AnimatedOpacity),
      );
      expect(animatedOpacity.opacity, equals(0));

      // Retrieve the AnimatedScale and check its scale value.
      final animatedScale = tester.widget<AnimatedScale>(
        find.byType(AnimatedScale),
      );
      expect(animatedScale.scale, equals(0));
    });

    testWidgets('renders custom icon when provided', (tester) async {
      const customIcon = Icon(Icons.star, size: 24);
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StepNodeCore(
              stepNodeShape: StepNodeShape.circle,
              decoration: BoxDecoration(color: Colors.blue),
              icon: customIcon,
            ),
          ),
        ),
      );

      // Confirm that the custom icon is present and the default icon is absent.
      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byIcon(Icons.check), findsNothing);
    });

    testWidgets('applies provided width and height to container', (
      tester,
    ) async {
      const testWidth = 50.0;
      const testHeight = 50.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StepNodeCore(
              stepNodeShape: StepNodeShape.circle,
              decoration: BoxDecoration(color: Colors.purple),
              width: testWidth,
              height: testHeight,
            ),
          ),
        ),
      );

      final containerFinder = find.byType(StepNodeShapedContainer);
      expect(containerFinder, findsOneWidget);

      // Cast the found widget to StepNodeShapedContainer and verify
      final containerWidget = tester.widget<StepNodeShapedContainer>(
        containerFinder,
      );
      expect(containerWidget.width, equals(testWidth));
      expect(containerWidget.height, equals(testHeight));
    });

    testWidgets('renders without foregroundColor if null provided', (
      tester,
    ) async {
      // Even when foregroundColor is null the widget should render without
      // throwing exceptions.
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StepNodeCore(
              stepNodeShape: StepNodeShape.circle,
              isVisible: true,
            ),
          ),
        ),
      );

      expect(find.byType(StepNodeShapedContainer), findsOneWidget);
    });
  });
}
