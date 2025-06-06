import 'package:boolean_validation/src/enum/supported_languages.dart';
import 'package:boolean_validation/src/regex/regex_mobile.dart';
import 'package:boolean_validation/src/core/extensions/string_extension.dart';
import 'enum/country_phone_codes.dart';
import 'regex/regex_patterns.dart';
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

    final domainPattern = RegExp(RegexPatterns.constrainedEmail(domain.name));
    return domainPattern.hasMatch(value.trim());
  }

  /// Validates a name ensuring it only contains alphabets
  bool isValidName(String? value,
      {required List<SupportedLanguage> multiLang}) {
    if (value == null || value.isEmpty) return false;

    // Combine all character sets from the selected language patterns
    final combinedCharSet = multiLang
        .map((lang) => lang.pattern.charSet) // use your extension getter here
        .join();

    // Build a regex that matches only characters in the combined set, for the whole string
    final pattern = RegExp('^[$combinedCharSet]+\$');

    return pattern.hasMatch(value.trim());
  }

  /// Validates if a mobile number is correct.
  ///
  /// Supports a variety of formats and country codes, including optional "+".
  /// ## Explanation:
  /// <img width="1200" src="https://i.sstatic.net/2QfiC.png"/>
  bool isCorrectMobileNumber(String? value, String? prefix) {
    if (value == null || value.isEmpty) return false;

    // Ensure prefix is formatted correctly
    final String countryCode = prefix?.replaceAll('+', '') ?? '';
    final String normalizedNumber =
        value.replaceAll(RegExp(r'\D'), ''); // Remove non-numeric characters

    // Use country-specific regex if available, otherwise fall back to default regex
    final pattern = RegExp(
        CountryPhonePattern.byIsoCode[countryCode.toUpperCase()]?.regex ??
            CountryPhonePattern.byDialCode[countryCode.toUpperCase()]?.regex ??
            MobileRegex.mobileNumber);

    return pattern.hasMatch(normalizedNumber);
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

  /// Validates if the input string can be parsed as an integer.
  bool isDouble(String? input) {
    try {
      double.parse(input ?? '');
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Validates if Input is a Positive Number
  bool isPositiveNum(String? input) {
    try {
      final number = num.parse(input ?? '');
      return number > 0;
    } catch (e) {
      return false;
    }
  }

  /// Validates a URL format.
  bool isValidUrl(String value) {
    try {
      final uri = Uri.parse(value);
      return uri.hasScheme && uri.host.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  /// Validates date in the format YYYY-MM-DD.
  bool isValidDate(String value) {
    final trimmed = value.trim();
    final regex = RegExp(RegexPatterns.date);

    if (!regex.hasMatch(trimmed)) return false;

    final parts = trimmed.split('-');
    final year = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final day = int.tryParse(parts[2]);

    if (year == null || month == null || day == null) return false;
    if (month < 1 || month > 12) return false;

    try {
      final date = DateTime(year, month, day);
      return date.year == year && date.month == month && date.day == day;
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
    return value.notNullOrEmpty();
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
    final upperCasePattern = RegExp(RegexPatterns.uppercaseLetters);
    return upperCasePattern.hasMatch(password);
  }

  bool containsLowerCase(String password) {
    final lowerCasePattern = RegExp(RegexPatterns.lowercaseLetters);
    return lowerCasePattern.hasMatch(password);
  }

  /// Check if password contains at least one digit.
  bool containsDigits(String password) {
    final digitPattern = RegExp(RegexPatterns.numbers);
    return digitPattern.hasMatch(password);
  }

  /// Check if password contains at least one special character.
  bool containsSpecialCharacter(String password) {
    final specialCharPattern = RegExp(RegexPatterns.specialCharacters);
    return specialCharPattern.hasMatch(password);
  }

  /// Validates if the input string contains only alphabetic characters
  /// matching **any** of the given languages. <br/>
  /// Returns false if the input is null or empty.
  bool isAlpha(String? value, {required List<SupportedLanguage> multiLang}) {
    if (value == null || value.isEmpty) return false;

    // Combine all character sets from the selected language patterns
    final combinedCharSet = multiLang
        .map((lang) => lang.pattern.charSet) // use your extension getter here
        .join();

    // Build a regex that matches only characters in the combined set, for the whole string
    final pattern = RegExp('^[$combinedCharSet]+\$');

    return pattern.hasMatch(value.trim());
  }

  /// Validates if the input string contains only alphanumeric characters.
  bool isAlphanumeric(String? value,
      {required List<SupportedLanguage> multiLang}) {
    if (value == null || value.isEmpty) return false;

    // Combine char sets from languages
    final combinedCharSet =
        multiLang.map((lang) => lang.pattern.charSet).join();

    // Add digits char set extracted from RegexPatterns.digits
    final digitsCharSet = RegexPatterns.digits.charSet;

    // Build regex pattern with combined charset and digits
    final pattern = RegExp('^[${combinedCharSet + digitsCharSet}]+\$');

    return pattern.hasMatch(value.trim());
  }
}
