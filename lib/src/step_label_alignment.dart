/// An enumeration that defines the possible alignments for step labels in a
/// step progress indicator.
///
/// The available alignments are:
/// - `top`: Aligns the label at the top of the step.
/// - `bottom`: Aligns the label at the bottom of the step.
/// - `left`: Aligns the label to the left of the step.
/// - `right`: Aligns the label to the right of the step.
/// - `topBottom`: Aligns the label at both the top and bottom of the step, with
/// the top label appearing first.
/// - `bottomTop`: Aligns the label at both the bottom and top of the step, with
/// the bottom label appearing first.
/// - `rightLeft`: Aligns the label at both the right and left of the step, with
/// the right label appearing first.
/// - `leftRight`: Aligns the label at both the left and right of the step, with
/// the left label appearing first.
enum StepLabelAlignment {
  top,
  bottom,
  left,
  right,
  topBottom,
  bottomTop,
  rightLeft,
  leftRight,
}
