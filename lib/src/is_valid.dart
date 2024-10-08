// validation_logic.dart
import 'regex_patterns.dart';
import 'package:boolean_validation/src/enum/email_domains.dart';

mixin class ValidationLogic {
  /// Validates if the input is a valid email.
  ///
  /// Uses regex to ensure the email format is correct.
  /// Supports various domains including popular providers such as Gmail, Yahoo, etc.
  bool isValidEmail(String? value) {
    final pattern = RegExp(RegexPatterns.email);
    return pattern.hasMatch(value?.trim() ?? '');
  }

  /// Validates email addresses only for specific providers (e.g., Gmail, Yahoo).
  bool isValidConstrainedEmail(String? value, EmailDomain domain) {
    if (value == null || value.isEmpty) {
      return false;
    }

    final domainPattern = RegExp(RegexPatterns.constrainedEmail(domain.domain));
    return domainPattern.hasMatch(value.trim());
  }

  /// Validates a name ensuring it only contains alphabets
  bool isValidName(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    final pattern = RegExp(RegexPatterns.name);
    return pattern.hasMatch(value);
  }

  /// Validates if a mobile number is correct.
  ///
  /// Supports a variety of formats and country codes, including optional "+".
  /// ## Explanation:
  /// <img width="1200" src="https://i.sstatic.net/2QfiC.png"/>
  bool isCorrectMobileNumber(String? value, String? prefix) {
    if (value == null || value.isEmpty) {
      return false;
    }

    if (prefix != null) {
      value = prefix + value;
    }

    final pattern = RegExp(RegexPatterns.mobileNumber);
    return pattern.hasMatch(value.trim());
  }

  /// Validates if the input string can be parsed as an integer.
  bool isInteger(String? input) {
    try {
      int.parse(input ?? '');
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Validates a URL format.
  bool isValidUrl(String value) {
    final pattern = RegExp(RegexPatterns.url);
    return pattern.hasMatch(value.trim());
  }

  /// Validates date in the format YYYY-MM-DD.
  bool isValidDate(String value) {
    final pattern = RegExp(RegexPatterns.date);
    if (!pattern.hasMatch(value.trim())) {
      return false;
    }
    try {
      DateTime.parse(value.trim());
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Validates a 16-digit credit card number using the Luhn algorithm.
  bool isValidCreditCard(String value) {
    final pattern = RegExp(RegexPatterns.creditCard);
    return pattern.hasMatch(value) && _luhnCheck(value.trim());
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

  /// Validates a username (alphanumeric with underscores, length between 4-20).
  bool isValidUsername(String value) {
    final pattern = RegExp(RegexPatterns.username);
    return pattern.hasMatch(value.trim());
  }

  /// Validates latitude (-90 to 90) and longitude (-180 to 180).
  bool isValidLatLng(double? lat, double? lng) {
    if (lat == null || lng == null) return false;
    return lat >= -90 && lat <= 90 && lng >= -180 && lng <= 180;
  }

  bool isValidLatitude(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }

    final pattern = RegExp(RegexPatterns.latitude);
    return pattern.hasMatch(value.trim());
  }

  bool isValidLongitude(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }

    final pattern = RegExp(RegexPatterns.longitude);
    return pattern.hasMatch(value.trim());
  }

  /// Validates that the value is non-null and non-empty (for required fields).
  bool isRequiredField(String? value) {
    return value != null && value.isNotEmpty;
  }

  /// Validates if the password meets basic complexity requirements.
  bool isValidPassword(String password) {
    final pattern = RegExp(RegexPatterns.password);
    return pattern.hasMatch(password);
  }

  /// Check if password meets the minimum length requirement.
  bool isPasswordLongEnough(String password, int minLength) {
    return password.length >= minLength;
  }

  /// Check if password contains at least one uppercase letter.
  bool containsUppercase(String password) {
    final upperCasePattern = RegExp(r'[A-Z]');
    return upperCasePattern.hasMatch(password);
  }

  /// Check if password contains at least one digit.
  bool containsDigits(String password) {
    final digitPattern = RegExp(r'\d');
    return digitPattern.hasMatch(password);
  }

  /// Check if password contains at least one special character.
  bool containsSpecialCharacter(String password) {
    final specialCharPattern = RegExp(r'[!@#\$&*~]');
    return specialCharPattern.hasMatch(password);
  }

  /// Validates if the input string contains only alphabetic characters.
  bool isAlpha(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    final pattern = RegExp(RegexPatterns.alpha);
    return pattern.hasMatch(value.trim());
  }

  /// Validates if the input string contains only alphanumeric characters.
  bool isAlphanumeric(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    final pattern = RegExp(RegexPatterns.alphanumeric);
    return pattern.hasMatch(value.trim());
  }
}
