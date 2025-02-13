// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:step_progress/src/step_line/step_line_style.dart';

void main() {
  group('StepLineStyle', () {
    test('Default constructor sets default values', () {
      const style = StepLineStyle();
      expect(
        style.lineThickness,
        equals(4),
        reason: 'The default line thickness should be 4',
      );
      expect(
        style.borderRadius,
        equals(BorderRadius.zero),
        reason: 'Default borderRadius should be BorderRadius.zero',
      );
      expect(
        style.foregroundColor,
        isNull,
        reason: 'Default foregroundColor should be null',
      );
      expect(
        style.activeColor,
        isNull,
        reason: 'Default activeColor should be null',
      );
      expect(
        style.animationDuration,
        isNull,
        reason: 'Default animationDuration should be null',
      );
    });

    test('Constructor sets provided non-default values', () {
      const foreground = Colors.red;
      const active = Colors.green;
      const duration = Duration(milliseconds: 300);
      const thickness = 6.0;
      final border = BorderRadius.circular(8);

      final style = StepLineStyle(
        foregroundColor: foreground,
        activeColor: active,
        animationDuration: duration,
        lineThickness: thickness,
        borderRadius: border,
      );

      expect(style.foregroundColor, equals(foreground));
      expect(style.activeColor, equals(active));
      expect(style.animationDuration, equals(duration));
      expect(style.lineThickness, equals(thickness));
      expect(style.borderRadius, equals(border));
    });

    test(
        'copyWith returns a new instance with same values if no arguments'
        ' provided', () {
      final style = StepLineStyle(
        foregroundColor: Colors.blue,
        activeColor: Colors.yellow,
        animationDuration: const Duration(seconds: 1),
        lineThickness: 10,
        borderRadius: BorderRadius.circular(5),
      );

      final copiedStyle = style.copyWith();

      expect(
        copiedStyle.foregroundColor,
        equals(style.foregroundColor),
        reason: 'foregroundColor should remain unchanged',
      );
      expect(
        copiedStyle.activeColor,
        equals(style.activeColor),
        reason: 'activeColor should remain unchanged',
      );
      expect(
        copiedStyle.animationDuration,
        equals(style.animationDuration),
        reason: 'animationDuration should remain unchanged',
      );
      expect(
        copiedStyle.lineThickness,
        equals(style.lineThickness),
        reason: 'lineThickness should remain unchanged',
      );
      expect(
        copiedStyle.borderRadius,
        equals(style.borderRadius),
        reason: 'borderRadius should remain unchanged',
      );
    });

    test('copyWith correctly overrides provided values', () {
      final style = StepLineStyle(
        foregroundColor: Colors.blue,
        activeColor: Colors.yellow,
        animationDuration: const Duration(seconds: 1),
        lineThickness: 10,
        borderRadius: BorderRadius.circular(5),
      );

      const newForeground = Colors.purple;
      const newDuration = Duration(milliseconds: 500);
      const newThickness = 12.0;
      final newBorderRadius = BorderRadius.circular(15);

      final copiedStyle = style.copyWith(
        foregroundColor: newForeground,
        animationDuration: newDuration,
        lineThickness: newThickness,
        borderRadius: newBorderRadius,
      );

      expect(
        copiedStyle.foregroundColor,
        equals(newForeground),
        reason: 'foregroundColor should be updated',
      );
      // activeColor was not provided in copyWith, so it should remain
      // unchanged.
      expect(
        copiedStyle.activeColor,
        equals(style.activeColor),
        reason: 'activeColor should remain unchanged',
      );
      expect(
        copiedStyle.animationDuration,
        equals(newDuration),
        reason: 'animationDuration should be updated',
      );
      expect(
        copiedStyle.lineThickness,
        equals(newThickness),
        reason: 'lineThickness should be updated',
      );
      expect(
        copiedStyle.borderRadius,
        equals(newBorderRadius),
        reason: 'borderRadius should be updated',
      );
    });

    test('copyWith throws assertion error with negative lineThickness', () {
      const style = StepLineStyle();
      expect(
        () => style.copyWith(lineThickness: -5),
        throwsAssertionError,
        reason: 'Negative line thickness is not allowed',
      );
    });

    test('copyWith with null parameters retains original non-null values', () {
      // This test checks that if a field is set in the original instance,
      // providing a null value explicitly in copyWith does not override it.
      final style = StepLineStyle(
        foregroundColor: Colors.orange,
        activeColor: Colors.green,
        animationDuration: const Duration(seconds: 2),
        lineThickness: 8,
        borderRadius: BorderRadius.circular(10),
      );

      // Passing null will trigger the fallback (null ?? original) which will
      // leave the original value intact.
      final copiedStyle = style.copyWith(
        foregroundColor: null,
        activeColor: null,
        animationDuration: null,
        lineThickness: null,
        borderRadius: null,
      );

      expect(
        copiedStyle.foregroundColor,
        equals(style.foregroundColor),
        reason: 'foregroundColor should remain unchanged',
      );
      expect(
        copiedStyle.activeColor,
        equals(style.activeColor),
        reason: 'activeColor should remain unchanged',
      );
      expect(
        copiedStyle.animationDuration,
        equals(style.animationDuration),
        reason: 'animationDuration should remain unchanged',
      );
      expect(
        copiedStyle.lineThickness,
        equals(style.lineThickness),
        reason: 'lineThickness should remain unchanged',
      );
      expect(
        copiedStyle.borderRadius,
        equals(style.borderRadius),
        reason: 'borderRadius should remain unchanged',
      );
    });
  });
}
