/// A class that contains various regular expressions used for validation purposes.
class RegexPatterns {
  /// Regular expression for validating email addresses.
  /// This pattern supports various email formats as per RFC 5322 specifications.
  static const String email =
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";

  /// Generates a regular expression for validating email addresses constrained to a specific domain.
  ///
  /// Example:
  /// ```dart
  /// String pattern = RegexPatterns.constrainedEmail("example.com");
  /// ```
  /// This will return a pattern that matches emails like "user@example.com".
  static String constrainedEmail(String domain) {
    return r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@" +
        RegExp.escape(domain) +
        r'$';
  }

  /// Regular expression for validating integers.
  /// This pattern supports both positive and negative integers.
  static const String integer = r'^[+-]?\d+$';

  /// Regular expression for validating URLs.
  /// This pattern supports HTTP and HTTPS protocols.
  @Deprecated(
      "Uri.parse() is being used instead of regex as this regex cause performance issues")
  static const String url =
      r'^(https?:\/\/)?([\da-z.-]+)\.([a-z.]{2,6})([/\w .-]*)*\/?$';

  /// Regular expression for validating dates in the format YYYY-MM-DD.
  /// This pattern ensures that the date follows the specified format.
  static const String date = r'^\d{4}-\d{1,2}-\d{1,2}$';

  /// Regular expression for validating 16-digit credit card numbers.
  /// This pattern uses a basic validation rule to ensure the card number is 16 digits.
  static const String creditCard = r'^[0-9]{16}$';

  /// Regular expression for validating usernames.
  /// This pattern allows letters, numbers, and underscores with a length between 4 to 20 characters.
  static const String username = r'^[a-zA-Z0-9_]{4,20}$';

  /// Regular expression for validating latitude values.
  /// This pattern supports valid latitude ranges from -90 to 90.
  static const String latitude = r'^-?([1-8]?\d(\.\d+)?|90(\.0+)?)$';

  /// Regular expression for validating longitude values.
  /// This pattern supports valid longitude ranges from -180 to 180.
  static const String longitude = r'^-?(1[0-7]?\d(\.\d+)?|180(\.0+)?)$';

  /// Regular expression for validating alphabetical strings.
  /// This pattern ensures that the string contains only alphabets (uppercase and lowercase).
  static const String alpha = r'^[a-zA-Z]+$';

  /// Regular expression for validating alphanumeric strings.
  /// This pattern ensures that the string contains only letters and numbers.
  static const String alphanumeric = r'^[a-zA-Z0-9]+$';
  static const String digits = r'^[0-9]+$';

  /// Regular expression for validating passwords.
  /// This pattern enforces a password to have at least 8 characters, including at least one uppercase letter, one digit, and one special character.
  static const String password =
      r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~_-]).{8,}$';

  /// Regular expression for validating numbers.
  static const String numbers = r'\d';

  /// Regular expression for validating special characters.
  // static final RegExp specialCharacters = RegExp(_specialCharacters);
  static const String specialCharacters =
      "[!@#\\\$%^&*()_+\\-=\\[\\]\\{\\}\\\\|;:',\".<>/?]";

  /// Regular expression for validating lower characters only
  static const String lowercaseLetters = r'[a-z]';

  /// Regular expression for validating upper characters only
  static const String uppercaseLetters = r'[A-Z]';

  ///  Unsafe special characters — avoid allowing these in non-sanitized inputs.
  /// These symbols can be used in:
  /// - XSS attacks (`<`, `>`, `"`, `'`)
  /// - Regex Denial of Service (ReDoS) (`*`, `+`, `?`, `{}`, `()`)
  /// - Path or command injection (`\`, `/`, `` ` ``)
  /// - Regex injection (`^`, `$`, `.`, `|`)
  ///
  /// Ref:
  /// https://owasp.org/www-community/attacks/xss/
  /// https://owasp.org/www-community/attacks/Regular_expression_Denial_of_Service_-_ReDoS
  ///
  static const String unsafeSymbols =
      "[<>\\{\\}\\^\$\\|\\*\\\\/.\\?\\+\\'\\\"`]";
}
