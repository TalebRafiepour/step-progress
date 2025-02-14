import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:step_progress/src/step_progress_theme.dart';
import 'package:step_progress/src/step_progress_theme_data.dart';

void main() {
  // Create dummy theme data instances for testing.
  // It is assumed that StepProgressThemeData either has a default constructor
  // or a constructor with parameters. Here we simply instantiate two different
  // instances.
  const dummyThemeData1 = StepProgressThemeData(
    defaultForegroundColor: Colors.grey,
  );
  const dummyThemeData2 = StepProgressThemeData();

  group('StepProgressTheme updateShouldNotify', () {
    test('returns false if data is the same instance', () {
      // Create two widgets with the same data instance.
      final oldWidget =
          StepProgressTheme(data: dummyThemeData1, child: Container());
      final newWidget =
          StepProgressTheme(data: dummyThemeData1, child: Container());
      // Expect updateShouldNotify to be false since they share same data.
      expect(newWidget.updateShouldNotify(oldWidget), isFalse);
    });

    test('returns true if data are different', () {
      // Create two widgets with different data instances.
      final oldWidget =
          StepProgressTheme(data: dummyThemeData1, child: Container());
      final newWidget =
          StepProgressTheme(data: dummyThemeData2, child: Container());
      // Expect updateShouldNotify to be true since the data has changed.
      expect(newWidget.updateShouldNotify(oldWidget), isTrue);
    });
  });

  group('StepProgressTheme.of', () {
    testWidgets('returns correct theme when in widget tree', (tester) async {
      // Create a test widget that reads StepProgressTheme using context.
      StepProgressThemeData? retrievedTheme;
      final testWidget = StepProgressTheme(
        data: dummyThemeData1,
        child: Builder(
          builder: (context) {
            // This will retrieve the theme from the widget tree.
            retrievedTheme = StepProgressTheme.of(context)?.data;
            return Container();
          },
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: testWidget,
        ),
      );
      // The retrieved theme should match the dummyThemeData1 we provided.
      expect(retrievedTheme, equals(dummyThemeData1));
    });

    testWidgets('returns null when not in widget tree', (tester) async {
      // Here we use Builder directly without wrapping it in StepProgressTheme.
      StepProgressTheme? retrievedTheme;
      final testWidget = Builder(
        builder: (context) {
          retrievedTheme = StepProgressTheme.of(context);
          return Container();
        },
      );

      await tester.pumpWidget(
        MaterialApp(
          home: testWidget,
        ),
      );
      // Since no StepProgressTheme is provided higher in the tree,
      // retrievedTheme should be null.
      expect(retrievedTheme, isNull);
    });
  });

  // Additional tests for edge cases:
  group('Additional tests', () {
    testWidgets('supports nested themes, retrieving the nearest ancestor',
        (tester) async {
      // Create two themes; the inner one should override the outer one.
      StepProgressThemeData? retrievedTheme;
      final outerTheme = StepProgressTheme(
        data: dummyThemeData1,
        child: StepProgressTheme(
          data: dummyThemeData2,
          child: Builder(
            builder: (context) {
              retrievedTheme = StepProgressTheme.of(context)?.data;
              return Container();
            },
          ),
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: outerTheme,
        ),
      );
      // The retrieved theme should be the inner one (dummyThemeData2).
      expect(retrievedTheme, equals(dummyThemeData2));
    });

    testWidgets('widget tree performance under repeated rebuilds',
        (tester) async {
      // Test scenario: rebuilds multiple times and ensures the theme remains
      // consistent.
      const statefulWidget = _ThemeTestWidget(
        initialData: dummyThemeData1,
        newTheme: dummyThemeData2,
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: statefulWidget,
        ),
      );

      // Retrieve initial theme value.
      final stateFinder = find.byType(_ThemeTestWidget);
      final _ThemeTestWidgetState state = tester.state(stateFinder);
      expect(state.getCurrentTheme(), equals(dummyThemeData1));

      // Trigger the theme update.
      state.updateTheme();
      await tester.pump();
      expect(state.getCurrentTheme(), equals(dummyThemeData2));
    });
  });
}

// A helper widget to test dynamic theme change.
class _ThemeTestWidget extends StatefulWidget {
  const _ThemeTestWidget({
    required this.initialData,
    required this.newTheme,
  });
  final StepProgressThemeData initialData;
  final StepProgressThemeData newTheme;

  @override
  _ThemeTestWidgetState createState() => _ThemeTestWidgetState();
}

class _ThemeTestWidgetState extends State<_ThemeTestWidget> {
  late StepProgressThemeData currentTheme;

  @override
  void initState() {
    super.initState();
    currentTheme = widget.initialData;
  }

  void updateTheme() {
    setState(() {
      currentTheme = widget.newTheme;
    });
  }

  StepProgressThemeData getCurrentTheme() => currentTheme;

  @override
  Widget build(BuildContext context) {
    return StepProgressTheme(
      data: currentTheme,
      child: Container(),
    );
  }
}
