extension NullString on String? {
  /// find if `String?` is
  ///
  /// **not** `null`
  ///
  /// and **not** Empty after `trim()`
  bool notNullOrEmpty() => this != null && this!.trim().isNotEmpty;

  /// find if `String?` is
  ///
  /// `null`
  ///
  /// OR
  ///
  /// Empty after `trim()`
  bool nullOrEmpty() => this == null || this!.trim().isEmpty;
}

extension RegexPatternHelpers on String {
  /// Returns the regex string without starting `^` and ending `$` anchors.
  String removeAnchors() => replaceAll(RegExp(r'^\^|\$$'), '');

  /// Extracts the character set inside square brackets [] and removes anchors and quantifiers (+).
  /// Example: r'^[a-zA-Z]+$' => 'a-zA-Z'
  String get charSet {
    // Remove anchors (^, $) and quantifier (+)
    final stripped = replaceAll(RegExp(r'^\^|\$$|\+$'), '');
    // Extract characters inside square brackets []
    final match = RegExp(r'\[(.*?)\]').firstMatch(stripped);
    if (match != null) {
      return match.group(1)!;
    }
    // If no [], maybe it's a simple range without brackets like '^[a-zA-Z]+$'
    // So remove ^ and $ and +, and return the middle part
    return stripped;
  }
}
