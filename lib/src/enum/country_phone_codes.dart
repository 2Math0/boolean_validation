import 'package:boolean_validation/boolean_validation.dart';

/// Represents mobile number validation config for a country
enum CountryPhonePattern {
  egypt('EG', '20', 'Egypt', MobileRegex.egyptRegex),
  usa('US', '1', 'United States', MobileRegex.usaRegex),
  canada('CA', '1', 'Canada', MobileRegex.canadaRegex),
  india('IN', '91', 'India', MobileRegex.indiaRegex),
  saudiArabia('SA', '966', 'Saudi Arabia', MobileRegex.saudiArabiaRegex),
  uk('UK', '44', 'United Kingdom', MobileRegex.ukRegex),
  france('FR', '33', 'France', MobileRegex.franceRegex),
  germany('DE', '49', 'Germany', MobileRegex.germanyRegex),
  italy('IT', '39', 'Italy', MobileRegex.italyRegex),
  brazil('BR', '55', 'Brazil', MobileRegex.brazilRegex),
  mexico('MX', '52', 'Mexico', MobileRegex.mexicoRegex),
  china('CN', '86', 'China', MobileRegex.chinaRegex),
  japan('JP', '81', 'Japan', MobileRegex.japanRegex),
  australia('AU', '61', 'Australia', MobileRegex.australiaRegex),
  southAfrica('ZA', '27', 'South Africa', MobileRegex.southAfricaRegex),
  russia('RU', '7', 'Russia', MobileRegex.russiaRegex),
  turkey('TR', '90', 'Turkey', MobileRegex.turkeyRegex),
  pakistan('PK', '92', 'Pakistan', MobileRegex.pakistanRegex),
  indonesia('ID', '62', 'Indonesia', MobileRegex.indonesiaRegex);

  final String isoCode;
  final String dialCode;
  final String name;
  final String regex;

  const CountryPhonePattern(this.isoCode, this.dialCode, this.name, this.regex);

  /// O(1), compile-time, fully traceable, keys in Country Two-letters
  static const Map<String, CountryPhonePattern> byIsoCode = {
    'EG': egypt,
    'US': usa,
    'CA': canada,
    'IN': india,
    'SA': saudiArabia,
    'UK': uk,
    'FR': france,
    'DE': germany,
    'IT': italy,
    'BR': brazil,
    'MX': mexico,
    'CN': china,
    'JP': japan,
    'AU': australia,
    'ZA': southAfrica,
    'RU': russia,
    'TR': turkey,
    'PK': pakistan,
    'ID': indonesia,
  };

  /// O(1), compile-time, fully traceable, keys in country codes
  static const Map<String, CountryPhonePattern> byDialCode = {
    '20': egypt,
    '1': usa,
    '91': india,
    '966': saudiArabia,
    '44': uk,
    '33': france,
    '49': germany,
    '39': italy,
    '55': brazil,
    '52': mexico,
    '86': china,
    '81': japan,
    '61': australia,
    '27': southAfrica,
    '7': russia,
    '90': turkey,
    '92': pakistan,
    '62': indonesia,
  };
}
