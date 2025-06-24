/// A class that contains various regular expressions
/// used for validation purposes.
class RegexPatterns {
  /// Regular expression for validating email addresses.
  /// This pattern supports various email formats
  /// as per RFC 5322 specifications.
  static const String email = r"[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+"
      r"(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@"
      r'(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+'
      r'[a-zA-Z]{2,}$';

  /// Generates a regular expression for validating email addresses constrained
  /// to a specific domain.
  ///
  /// Example:
  /// ```dart
  /// String pattern = RegexPatterns.constrainedEmail("example.com");
  /// ```
  /// This will return a pattern that matches emails like "user@example.com".
  static String constrainedEmail(String domain) {
    return r"[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+"
        r"(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@"
        '${RegExp.escape(domain)}\$';
  }

  /// Regular expression for validating integers.
  /// This pattern supports both positive and negative integers.
  static const String integer = r'^[+-]?\d+$';

  /// Regular expression for validating URLs.
  /// This pattern supports HTTP and HTTPS protocols.
  @Deprecated(
    'Uri.parse() is being used instead of regex'
    ' as this regex cause performance issues',
  )
  static const String url =
      r'^(https?:\/\/)?([\da-z.-]+)\.([a-z.]{2,6})([/\w .-]*)*\/?$';

  /// Regular expression for validating dates in the format YYYY-MM-DD.
  /// This pattern ensures that the date follows the specified format.
  static const String date = r'^\d{4}-\d{1,2}-\d{1,2}$';

  /// Regular expression for validating 16-digit credit card numbers.
  /// This pattern uses a basic validation rule
  /// to ensure the card number is 16 digits.
  static const String creditCard = r'^[0-9]{16}$';

  /// Regular expression for validating usernames.
  /// This pattern allows letters, numbers,
  /// and underscores with a length between 4 to 20 characters.
  static const String username = r'^[a-zA-Z0-9_]{4,20}$';

  /// Regular expression for validating latitude values.
  /// This pattern supports valid latitude ranges from -90 to 90.
  static const String latitude = r'^-?([1-8]?\d(\.\d+)?|90(\.0+)?)$';

  /// Regular expression for validating longitude values.
  /// This pattern supports valid longitude ranges from -180 to 180.
  static const String longitude = r'^-?(1[0-7]?\d(\.\d+)?|180(\.0+)?)$';

  /// Regular expression for validating alphabetical strings.
  /// This pattern ensures that the string contains
  /// only alphabets (uppercase and lowercase).
  static const String alpha = r'^[a-zA-Z]+$';

  /// Regular expression for validating alphanumeric strings.
  /// This pattern ensures that the string contains only letters and numbers.
  static const String alphanumeric = r'^[a-zA-Z0-9]+$';
  static const String digits = r'^[0-9]+$';

  /// Regular expression for validating passwords.
  /// This pattern enforces a password to have at least 8 characters,
  /// including at least one uppercase letter, one digit,
  /// and one special character.
  static const String password =
      r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~_-]).{8,}$';

  /// Regular expression for validating numbers.
  static const String numbers = r'\d';

  /// Regular expression for validating special characters.
  // static final RegExp specialCharacters = RegExp(_specialCharacters);
  static const String specialCharacters =
      "[!@#\\\$%^&*()_+\\-=\\[\\]\\{\\}\\\\|;:',\".<>/?]";

  /// Regular expression for validating lower characters only
  static const String lowercaseLetters = '[a-z]';

  /// Regular expression for validating upper characters only
  static const String uppercaseLetters = '[A-Z]';

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

  /// # Builds a flexible and anchored regex pattern
  /// using groups of OR and AND conditions.
  ///
  /// - [orGroups]: A list of groups,
  /// where each group is treated as an OR condition.
  ///   The entire group becomes a single lookahead: `(?=.*(a|b|c))`.
  ///
  /// - [andGroups]: A list of groups,
  /// where each item is enforced using a lookahead.
  ///   Each pattern must be present somewhere in the string: `(?=.*a)(?=.*b)`.
  ///
  /// - [matchAllIfEmpty]: If true and no groups are provided,
  /// the pattern will match any input (`^.*$`).
  ///   If false (default), an empty config will produce
  ///   a regex that matches nothing (`^(?!)$`).
  ///
  /// All input patterns are sanitized
  /// to remove any leading `^` or trailing `$` anchors,
  /// ensuring safe composition within lookaheads and groups.
  ///
  /// Returns a full anchored regex string: `^...$`
  ///
  /// ## Example:
  /// ```dart
  /// final pattern = buildFastRegex(
  ///   orGroups: [
  ///     [r'[a-z]', r'[A-Z]', r'[0-9]'],   // any letter or digit
  ///     [r'foo', r'bar']                  // OR contains "foo" or "bar"
  ///   ],
  ///   andGroups: [
  ///     [r'[+-]?\d+'],                    // must contain integer
  ///     [r'[a-zA-Z]+'],                   // must contain at least one letter
  ///     [r'xyz', r'token'],               // both "xyz" and "token" must appear
  ///   ],
  /// );
  ///
  /// final regex = RegExp(pattern);
  /// print(regex.hasMatch('foo123xyzTOKEN')); // true
  /// ```
  ///
  /// Example result:
  /// ```
  /// ^(?=.*(?:[a-z]|[A-Z]|[0-9]))(?=.*(?:foo|bar))(?=.*[+-]?\d+)(?=.*[a-zA-Z]+)(?=.*xyz)(?=.*token).*$
  /// ```
  static String buildFlexibleRegex({
    List<List<String>> orGroups = const [],
    List<List<String>> andGroups = const [],
    bool matchAllIfEmpty = false,
  }) {
    if (orGroups.isEmpty && andGroups.isEmpty) {
      return matchAllIfEmpty ? r'^.*$' : r'^(?!)$';
    }

    final orExpressions = <String>[];
    final andExpressions = <String>[];

    // Collect OR lookaheads
    for (final group in orGroups) {
      if (group.isNotEmpty) {
        final joined = group.map(sanitize).join('|');
        orExpressions.add('(?=.*(?:$joined))');
      }
    }

    // Collect AND lookaheads
    for (final group in andGroups) {
      andExpressions.addAll(buildAndLookaheads(group));
    }

    final buffer = StringBuffer('^');

    if (orExpressions.isNotEmpty && andExpressions.isNotEmpty) {
      // Mix of OR and AND: group ORs inside a non-capturing group with ANDs
      buffer
        ..write('(?:${orExpressions.join('|')})')
        ..write(andExpressions.join());
    } else if (orExpressions.isNotEmpty) {
      // Only ORs
      buffer.write('(?:${orExpressions.join('|')})');
    } else {
      // Only ANDs
      buffer.write(andExpressions.join());
    }

    buffer.write(r'.*$');
    return buffer.toString();
  }

  /// Sanitizes a pattern by removing leading ^ and trailing $
  static String sanitize(String pattern) =>
      pattern.replaceAll(RegExp(r'^\^|\$+$'), '');

  /// Builds a single lookahead for an OR group: (?=.*(a|b|c))
  static String? buildOrLookahead(List<String> group) {
    if (group.isEmpty) return null;
    final joined = group.map(sanitize).join('|');
    return '(?=.*(?:$joined))';
  }

  /// Builds multiple lookaheads for an AND group: (?=.*a)(?=.*b)
  static List<String> buildAndLookaheads(List<String> group) {
    return group.map((pattern) => '(?=.*${sanitize(pattern)})').toList();
  }

  /// Utility to strip outer brackets and join multiple character classes.
  static String combineCharsets(Iterable<String> charsets) {
    return charsets.map((pattern) {
      final match = RegExp(r'^\[([^\]]+)\]$').firstMatch(pattern);
      return match?.group(1) ?? pattern;
    }).join();
  }
}
