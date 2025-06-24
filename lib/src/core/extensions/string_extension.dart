import 'package:boolean_validation/src/annotation/experimental.dart';
import 'package:meta/meta.dart';

/// Extension on Null String
extension NullString on String? {
  /// find if `String?` is
  ///
  /// **not** `null`
  ///
  /// and **not** Empty after `trim()`
  bool get notNullOrEmpty => this != null && this!.trim().isNotEmpty;

  /// find if `String?` is
  ///
  /// `null`
  ///
  /// OR
  ///
  /// Empty after `trim()`
  bool get nullOrEmpty => this == null || this!.trim().isEmpty;
}

/// Extension on String for Regex functions
extension RegexPatternHelpers on String {
  /// Returns the regex string without starting `^` and ending `$` anchors.
  String get removeAnchors => replaceAll(RegExp(r'^\^|\$$'), '');

  /// Extracts the character set inside square brackets []
  /// and removes anchors and quantifiers (+).
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

@internal
@UnderDevelopment()
extension StringValidationExtension on String {
  /// Trims and normalizes whitespace (converts multiple spaces to single space)
  String get normalizeWhitespace => trim().replaceAll(RegExp(r'\s+'), ' ');

  /// Checks if string contains only whitespace characters
  bool get isOnlyWhitespace => trim().isEmpty;

  /// Splits string by whitespace and filters empty parts
  List<String> get nameParts =>
      normalizeWhitespace.split(' ').where((part) => part.isNotEmpty).toList();

  /// Checks if string contains special characters
  /// (excluding common name punctuation)
  bool get containsInvalidSpecialChars =>
      RegExp("[!@#\\\$%^&*()+={}\\[\\]|\\\\:;'<>,./~`\"]").hasMatch(this); //
  //     /// Checks if string contains only valid name punctuation (hyphens and apostrophes)
  bool get containsOnlyValidPunctuation =>
      !RegExp(r"[^\w\s\-\\']", unicode: true).hasMatch(this);

  /// Gets character count for different character types
  NameCharacterAnalysis get characterAnalysis {
    var letters = 0;
    var numbers = 0;
    var spaces = 0;
    var punctuation = 0;
    var other = 0;

    for (var i = 0; i < length; i++) {
      final char = this[i];
      if (RegExp(r'\p{L}', unicode: true).hasMatch(char)) {
        letters++;
      } else if (RegExp(r'\d').hasMatch(char)) {
        numbers++;
      } else if (char == ' ') {
        spaces++;
      } else if (RegExp(r"[-\'.]").hasMatch(char)) {
        punctuation++;
      } else {
        other++;
      }
    }

    return NameCharacterAnalysis(
      letters: letters,
      numbers: numbers,
      spaces: spaces,
      punctuation: punctuation,
      other: other,
      total: length,
    );
  }

  /// Validates string length within specified bounds
  bool isLengthValid({int? minLength, int? maxLength}) {
    if (minLength != null && length < minLength) return false;
    if (maxLength != null && length > maxLength) return false;
    return true;
  }

  /// Sanitizes string for name validation
  String sanitizeForName({bool preserveSpaces = true}) {
    var result = this;

    // Remove invalid characters but preserve valid punctuation
    result = result.replaceAll(RegExp(r"[^\p{L}\s\-']", unicode: true), '');
    if (preserveSpaces) {
      // Normalize whitespace
      result = result.normalizeWhitespace;
    } else {
      // Remove all spaces
      result = result.replaceAll(' ', '');
    }

    return result;
  }
}

@internal
@UnderDevelopment()

/// Extension specifically for nullable strings
extension NullableStringValidationExtension on String? {
  /// Safe trim that handles null
  String get safeTrim => this?.trim() ?? '';

  /// Safe normalize whitespace that handles null
  String get safeNormalizeWhitespace => this?.normalizeWhitespace ?? '';
}

/// Analysis result for character composition of a string
@internal
@UnderDevelopment()
class NameCharacterAnalysis {
  const NameCharacterAnalysis({
    required this.letters,
    required this.numbers,
    required this.spaces,
    required this.punctuation,
    required this.other,
    required this.total,
  });

  final int letters;
  final int numbers;
  final int spaces;
  final int punctuation;
  final int other;
  final int total;

  /// Percentage of letters in the string
  double get letterPercentage => total > 0 ? (letters / total) * 100 : 0;

  /// Whether string is primarily alphabetic (>80% letters)
  bool get isPrimarilyAlphabetic => letterPercentage > 80;

  /// Whether string contains any invalid characters for names
  bool get hasInvalidCharacters => other > 0;

  /// Whether string has reasonable character composition for a name
  bool get isReasonableNameComposition {
    // Must be primarily alphabetic
    if (!isPrimarilyAlphabetic) return false;

    // Cannot have invalid characters
    if (hasInvalidCharacters) return false;

    // Numbers should be minimal or none
    if (total > 0 && (numbers / total) > 0.1) return false;

    return true;
  }

  @override
  String toString() {
    return 'NameCharacterAnalysis(letters: $letters, numbers: $numbers, '
        'spaces: $spaces, punctuation: $punctuation, other: $other, '
        'total: $total, '
        'letterPercentage: ${letterPercentage.toStringAsFixed(1)}%)';
  }
}
