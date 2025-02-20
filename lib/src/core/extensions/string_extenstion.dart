extension NullString on String?{
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