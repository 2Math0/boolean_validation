import 'package:boolean_validation/src/regex/regex_patterns.dart';

extension MobileRegex on RegexPatterns {
  /// Regular expression for validating mobile numbers.
  /// This pattern supports various formats of mobile numbers including international formats.
  static const String mobileNumber =
      r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)';

  /// Regex for Mobile Numbers for Different Countries
  static const String egyptRegex =
      r'^(?:10|11|12|15)\d{8}$'; // Egypt (11 digits)
  static const String usaRegex = r'^\d{10}$'; // USA (10 digits)
  static const String canadaRegex = r'^\d{10}$'; // Canada (10 digits)
  static const String indiaRegex =
      r'^[6789]\d{9}$'; // India (10 digits, starts with 6,7,8,9)
  static const String saudiArabiaRegex =
      r'^(?:05|9665)\d{8}$'; // Saudi Arabia (10 digits)
  static const String ukRegex =
      r'^(?:7\d{9})$'; // UK (11 digits, starts with 7)
  static const String franceRegex =
      r'^(?:06|07)\d{8}$'; // France (10 digits, starts with 06,07)
  static const String germanyRegex =
      r'^(?:015|016|017)\d{8}$'; // Germany (10-11 digits)
  static const String italyRegex =
      r'^(?:3\d{9})$'; // Italy (10 digits, starts with 3)
  static const String brazilRegex = r'^\d{11}$'; // Brazil (11 digits)
  static const String mexicoRegex = r'^\d{10}$'; // Mexico (10 digits)
  static const String chinaRegex =
      r'^1[3-9]\d{9}$'; // China (11 digits, starts with 13-19)
  static const String japanRegex = r'^\d{10,11}$'; // Japan (10-11 digits)
  static const String australiaRegex =
      r'^(?:04)\d{8}$'; // Australia (10 digits, starts with 04)
  static const String southAfricaRegex =
      r'^(?:06|07|08)\d{8}$'; // South Africa (10 digits)
  static const String russiaRegex =
      r'^(?:9\d{9})$'; // Russia (10 digits, starts with 9)
  static const String turkeyRegex =
      r'^(?:5\d{9})$'; // Turkey (10 digits, starts with 5)
  static const String pakistanRegex =
      r'^(?:03\d{9})$'; // Pakistan (11 digits, starts with 03)
  static const String indonesiaRegex =
      r'^(?:08\d{9,10})$'; // Indonesia (10-11 digits)
}


