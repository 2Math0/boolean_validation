import 'package:boolean_validation/src/regex/regex_patterns.dart';

extension MobileRegex on RegexPatterns {
  /// Regular expression for validating mobile numbers.
  /// This pattern supports various formats
  /// of mobile numbers including international formats.
  static const String mobileNumber =
      r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)';

  static const String mobileNumberWithoutLeadingPlus = r'^(?:[1-9]\d{7,14})$';

  /// Regex for Mobile Numbers for Different Countries

  // Existing patterns
  static const String usaRegex = r'^\d{10}$'; // USA (10 digits)
  static const String canadaRegex = r'^\d{10}$'; // Canada (10 digits)
  static const String indiaRegex =
      r'^[6789]\d{9}$'; // India (10 digits, starts with 6,7,8,9)

  /// Regex to validate Saudi Arabian phone numbers in international format.
  ///
  /// Supports:
  /// - Mobile numbers (e.g., STC, Mobily, Zain):
  /// starts with `9665` and followed by 8 digits.
  /// - Landline numbers: starts with `9661` and followed by 7 digits.
  /// - Toll-free numbers: starts with `966800` and followed by 6 or 7 digits.
  /// - Service/unified numbers: starts with `9669200` and followed by 5 digits.
  static const String saudiArabiaRegex =
      r'^((5\d{8})|(11|12|13|14|16|17)\d{7}|800\d{6,7}|9200\d{5})$'; // Saudi Arabia (10 digits)
  static const String ukRegex =
      r'^(?:7\d{9})$'; // UK (11 digits, starts with 7)

  /// French mobile number regex (without country code):
  /// - Expects 9 digits starting with 6 or 7 (i.e., mobile formats)
  /// - Examples matched: '612345678', '712345678'
  static const String franceRegex =
      r'^(6|7)\d{8}$'; // France (10 digits, starts with 06,07)
  static const String germanyRegex =
      r'^1(5|6|7)\d{8,9}$'; // Germany (10-11 digits)
  static const String italyRegex =
      r'^(?:3\d{9})$'; // Italy (10 digits, starts with 3)
  static const String brazilRegex = r'^\d{11}$'; // Brazil (11 digits)
  static const String mexicoRegex = r'^\d{10}$'; // Mexico (10 digits)
  static const String chinaRegex =
      r'^1[3-9]\d{9}$'; // China (11 digits, starts with 13-19)
  static const String japanRegex = r'^\d{10,11}$'; // Japan (10-11 digits)
  static const String australiaRegex =
      r'^4\d{8}$'; // Australia (10 digits, starts with 04)
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

  /// Arabic Countries
  // Egypt Regex (11 digits) must start with 10, 11, 12, or 15
  static const String egyptRegex =
      r'^(?:10|11|12|15)\d{8}$'; // Egypt (11 digits)

  /// Algeria - 9 digits, starts with 5, 6, or 7
  static const String algeriaRegex = r'^(?:[567]\d{8})$';

  /// Bahrain - 8 digits, starts with 3
  static const String bahrainRegex = r'^(?:3\d{7})$';

  /// Comoros - 7 digits, starts with 3 or 7
  static const String comorosRegex = r'^(?:[37]\d{6})$';

  /// Djibouti - 8 digits, starts with 77
  static const String djiboutiRegex = r'^(?:77\d{6})$';

  /// Iraq - 10 digits, starts with 07
  static const String iraqRegex = r'^(?:07\d{8})$';

  /// Jordan - 9 digits, starts with 7
  static const String jordanRegex = r'^(?:7[789]\d{7})$';

  /// Kuwait - 8 digits, starts with 5, 6, or 9
  static const String kuwaitRegex = r'^(?:[569]\d{7})$';

  /// Lebanon - 8 digits, starts with 3, 7, or 8
  static const String lebanonRegex = r'^(?:[378]\d{7})$';

  /// Libya - 9 digits, starts with 9
  static const String libyaRegex = r'^(?:9[12345]\d{7})$';

  /// Mauritania - 8 digits, starts with 2, 3, 4, or 6
  static const String mauritaniaRegex = r'^(?:[2346]\d{7})$';

  /// Morocco - 9 digits, starts with 6 or 7
  static const String moroccoRegex = r'^(?:[67]\d{8})$';

  /// Oman - 8 digits, starts with 9
  static const String omanRegex = r'^(?:9[0-9]\d{6})$';

  /// Palestine - 9 digits, starts with 05
  static const String palestineRegex = r'^(?:05[69]\d{7})$';

  /// Qatar - 8 digits, starts with 3, 5, 6, or 7
  static const String qatarRegex = r'^(?:[3567]\d{7})$';

  /// Somalia - 9 digits, starts with 6
  static const String somaliaRegex = r'^(?:6[12345]\d{7})$';

  /// Sudan - 9 digits, starts with 9
  static const String sudanRegex = r'^(?:9[012]\d{7})$';

  /// Syria - 9 digits, starts with 9
  static const String syriaRegex = r'^(?:9[3456789]\d{7})$';

  /// Tunisia - 8 digits, starts with 2, 4, 5, or 9
  static const String tunisiaRegex = r'^(?:[2459]\d{7})$';

  /// United Arab Emirates - 9 digits, starts with 5
  static const String uaeRegex = r'^(?:5[024-6]\d{7})$';

  /// Yemen - 9 digits, starts with 7
  static const String yemenRegex = r'^(?:7[0137]\d{7})$';
}
