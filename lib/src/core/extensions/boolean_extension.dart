/// Extension to check if a boolean is true or false
extension NullBool on bool? {
  /// find if `bool?` is true
  bool get isTrue => this ?? false;

  /// find if `bool?` is false
  bool get isFalse => this == false;
}
