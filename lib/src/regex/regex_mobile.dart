import 'package:boolean_validation/src/regex/regex_patterns.dart';

extension MobileRegex on RegexPatterns {
  /// Regular expression for validating mobile numbers.
  /// This pattern supports various formats of mobile numbers including international formats.
  static const String mobileNumber =
      r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)';

  /// Regex for Mobile Numbers for Different Countries
  static const String egypt =
      r'^(?:010|011|012|015)\d{7}$'; // Egypt (11 digits)
  static const String usa = r'^\d{10}$'; // USA (10 digits)
  static const String canada = r'^\d{10}$'; // Canada (10 digits)
  static const String india =
      r'^[6789]\d{9}$'; // India (10 digits, starts with 6,7,8,9)
  static const String saudiArabia =
      r'^(?:05|9665)\d{8}$'; // Saudi Arabia (10 digits)
  static const String uk = r'^(?:7\d{9})$'; // UK (11 digits, starts with 7)
  static const String france =
      r'^(?:06|07)\d{8}$'; // France (10 digits, starts with 06,07)
  static const String germany =
      r'^(?:015|016|017)\d{8}$'; // Germany (10-11 digits)
  static const String italy =
      r'^(?:3\d{9})$'; // Italy (10 digits, starts with 3)
  static const String brazil = r'^\d{11}$'; // Brazil (11 digits)
  static const String mexico = r'^\d{10}$'; // Mexico (10 digits)
  static const String china =
      r'^1[3-9]\d{9}$'; // China (11 digits, starts with 13-19)
  static const String japan = r'^\d{10,11}$'; // Japan (10-11 digits)
  static const String australia =
      r'^(?:04)\d{8}$'; // Australia (10 digits, starts with 04)
  static const String southAfrica =
      r'^(?:06|07|08)\d{8}$'; // South Africa (10 digits)
  static const String russia =
      r'^(?:9\d{9})$'; // Russia (10 digits, starts with 9)
  static const String turkey =
      r'^(?:5\d{9})$'; // Turkey (10 digits, starts with 5)
  static const String pakistan =
      r'^(?:03\d{9})$'; // Pakistan (11 digits, starts with 03)
  static const String indonesia =
      r'^(?:08\d{9,10})$'; // Indonesia (10-11 digits)

  static final Map<String, String> mobileNumberPatterns = {
    'EG': egypt, '20': egypt,   // Egypt
    'US': usa, '1': usa,        // USA
    'CA': canada, // Canada, its internation dialing code same as US so as it regex
    'IN': india, '91': india,   // India
    'SA': saudiArabia, '966': saudiArabia, // Saudi Arabia
    'UK': uk, '44': uk,         // United Kingdom
    'FR': france, '33': france, // France
    'DE': germany, '49': germany, // Germany
    'IT': italy, '39': italy,   // Italy
    'BR': brazil, '55': brazil, // Brazil
    'MX': mexico, '52': mexico, // Mexico
    'CN': china, '86': china,   // China
    'JP': japan, '81': japan,   // Japan
    'AU': australia, '61': australia, // Australia
    'ZA': southAfrica, '27': southAfrica, // South Africa
    'RU': russia, '7': russia,  // Russia
    'TR': turkey, '90': turkey, // Turkey
    'PK': pakistan, '92': pakistan, // Pakistan
    'ID': indonesia, '62': indonesia, // Indonesia
  };
}
