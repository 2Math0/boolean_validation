import 'package:meta/meta.dart';

/// Marks a public API as experimental or subject to change.
///
/// Use this to indicate that while the function or class is usable,
/// it may change or be removed in future versions.
@internal
class UnderDevelopment {
  const UnderDevelopment([this.note = '']);

  final String note;
}
