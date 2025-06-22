/// A class that contains various regular expressions used for validation purposes.
class RegexPatterns {
  /// Regular expression for validating email addresses.
  /// This pattern supports various email formats as per RFC 5322 specifications.
  static const String email = r"[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+"
      r"(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@"
      r"(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+"
      r"[a-zA-Z]{2,}$";

  /// Generates a regular expression for validating email addresses constrained to a specific domain.
  ///
  /// Example:
  /// ```dart
  /// String pattern = RegexPatterns.constrainedEmail("example.com");
  /// ```
  /// This will return a pattern that matches emails like "user@example.com".
  static String constrainedEmail(String domain) {
    return r"[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+"
        r"(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@"
        "${RegExp.escape(domain)}\$";
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

  /// # Builds a complex regex expression using groups of OR and AND patterns.
  ///
  /// - [orGroups]: Each inner list is joined as an OR expression: `(a|b|c)`
  /// - [andGroups]: Each inner list is joined with lookahead assertions: `(?=.*a)(?=.*b)`
  ///
  /// This function supports only `String` regex patterns (either raw or standard),
  /// and automatically strips any leading `^` or trailing `$` anchors from them.
  ///
  /// Returns a full anchored regex string: `^...$`
  ///
  /// ## Example:
  /// ```dart
  /// final pattern = RegexPatterns().buildComplexRegex(
  ///   orGroups: [
  ///     [RegexPatterns.lowercaseLetters, RegexPatterns.uppercaseLetters, RegexPatterns.digits],
  ///     [r'foo', r'bar']
  ///   ],
  ///   andGroups: [
  ///     [RegexPatterns.integer, RegexPatterns.alpha],
  ///     [r'xyz', r'token']
  ///   ],
  /// );
  ///
  /// // Result:
  /// // ^([a-z]|[A-Z]|[0-9])(foo|bar)(?=.*^[+-]?\d+$)(?=.*^[a-zA-Z]+$)(?=.*xyz)(?=.*token)$
  /// ```
  String buildComplexRegex({
    List<List<String>> orGroups = const [],
    List<List<String>> andGroups = const [],
  }) {
    /// Removes ^ and $ anchors from a regex pattern string.
    String sanitize(String pattern) =>
        pattern.replaceAll(RegExp(r'^\^|\$+$'), '');

    /// Converts a group of patterns into an OR expression: (a|b|c)
    String orGroup(List<String> group) => '(${group.map(sanitize).join('|')})';

    /// Converts a group of patterns into an AND expression: (?=.*a)(?=.*b)
    String andGroup(List<String> group) =>
        group.map((g) => '(?=.*${sanitize(g)})').join();

    final buffer = StringBuffer('^');

    for (final group in orGroups) {
      buffer.write(orGroup(group));
    }

    for (final group in andGroups) {
      buffer.write(andGroup(group));
    }

    buffer.write(r'$');
    return buffer.toString();
  }
}
