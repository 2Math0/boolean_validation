mixin class ValidationLogic {
  bool isValidEmail(String? value) {
    final pattern =
    RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)"
    r"*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+"
    r"[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
    return pattern.hasMatch(value ?? '');
  }

  bool isValidName(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    final pattern = RegExp(r'^[a-zA-Z ]+$');
    return pattern.hasMatch(value);
  }

  /// ## Explanation:
  /// <img width="1200" src="https://i.sstatic.net/2QfiC.png"/>
  bool isCorrectMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    final pattern = RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)');
    return pattern.hasMatch(value);
  }

  bool isInteger(String? input) {
    try {
      int.parse(input ?? '');
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isValidUrl(String value) {
    final pattern =
    RegExp(r'^(https?:\/\/)?([\da-z.-]+)\.([a-z.]{2,6})([/\w .-]*)*\/?$');
    return pattern.hasMatch(value);
  }

  bool isValidDate(String value) {
    final pattern = RegExp(r'^\d{4}-\d{2}-\d{2}$'); // Simple YYYY-MM-DD format
    if (!pattern.hasMatch(value)) {
      return false;
    }
    try {
      DateTime.parse(value);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isValidCreditCard(String value) {
    final pattern = RegExp(r'^[0-9]{16}$'); // Simple check for 16-digit number
    return pattern.hasMatch(value) && _luhnCheck(value);
  }

  bool _luhnCheck(String value) {
    int sum = 0;
    bool alternate = false;
    for (int i = value.length - 1; i >= 0; i--) {
      int n = int.parse(value[i]);
      if (alternate) {
        n *= 2;
        if (n > 9) {
          n -= 9;
        }
      }
      sum += n;
      alternate = !alternate;
    }
    return sum % 10 == 0;
  }

  bool isValidUsername(String value) {
    final pattern = RegExp(r'^[a-zA-Z0-9_]{4,20}$');
    return pattern.hasMatch(value);
  }
}