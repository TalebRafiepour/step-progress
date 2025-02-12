import 'package:flutter/widgets.dart';

/// A widget that controls the visibility of its child widget.
///
/// The [VisibilityWidget] can either show or hide its child while maintaining
/// the child's layout space. When hidden, the child becomes fully transparent
/// and non-interactive.
///
/// Example usage:
/// ```dart
/// VisibilityWidget(
///   visible: true,
///   child: Text('This text will be visible'),
/// )
/// ```
class VisibilityWidget extends StatelessWidget {
  /// Creates a [VisibilityWidget].
  ///
  /// The [child] parameter is required and specifies the widget to show or
  /// hide.
  /// The [visible] parameter determines whether the child is visible.
  const VisibilityWidget({
    required this.child,
    this.visible = false,
    super.key,
  });

  /// The widget below this widget in the tree.
  ///
  /// This widget will be shown or hidden based on the [visible] parameter.
  final Widget child;

  /// Whether the child widget is visible.
  ///
  /// If true, the child widget will be displayed normally.
  /// If false, the child widget will be invisible but will maintain its layout
  /// space. Defaults to false.
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return visible
        ? child
        : IgnorePointer(
            child: Opacity(
              opacity: 0,
              child: child,
            ),
          );
  }
}
