extension NullBool on bool? {
  bool get isTrue => this == true;

  bool get isFalse => this == false;
}
