import 'package:meta/meta.dart';

/// Represents an email domain, either predefined or custom.
@immutable
class EmailDomain {
  /// Private base constructor.
  const EmailDomain._(this.domainName);

  /// Named constructor for creating a custom email domain.
  /// Factory constructor that caches custom domains.
  factory EmailDomain.custom(String customDomain) {
    final domain = customDomain.toLowerCase();
    return _customDomains.putIfAbsent(domain, () => EmailDomain._(domain));
  }

  @Deprecated('Use [domainName] instead')

  /// The domain name string (e.g., 'gmail.com').
  String get name => domainName;

  /// The domain name string (e.g., 'gmail.com').
  final String domainName;

  /// Predefined popular email domains.
  /// Gmail.com email domain.
  static const EmailDomain gmail = EmailDomain._('gmail.com');

  /// Yahoo.com email domain.
  static const EmailDomain yahoo = EmailDomain._('yahoo.com');

  /// Hotmail.com email domain.
  static const EmailDomain hotmail = EmailDomain._('hotmail.com');

  /// Outlook.com email domain.
  static const EmailDomain outlook = EmailDomain._('outlook.com');

  /// iCloud.com email domain.
  static const EmailDomain icloud = EmailDomain._('icloud.com');

  /// AOL.com email domain.
  static const EmailDomain aol = EmailDomain._('aol.com');

  /// MSN.com email domain.
  static const EmailDomain msn = EmailDomain._('msn.com');

  /// Mail.com email domain.
  static const EmailDomain mail = EmailDomain._('mail.com');

  /// Zoho.com email domain.
  static const EmailDomain zoho = EmailDomain._('zoho.com');

  /// ProtonMail.com email domain.
  static const EmailDomain protonmail = EmailDomain._('protonmail.com');

  /// GMX.com email domain.
  static const EmailDomain gmx = EmailDomain._('gmx.com');

  /// Live.com email domain.
  static const EmailDomain live = EmailDomain._('live.com');

  /// Me.com email domain.
  static const EmailDomain me = EmailDomain._('me.com');

  /// Inbox.com email domain.
  static const EmailDomain inbox = EmailDomain._('inbox.com');

  /// Yandex.com email domain.
  static const EmailDomain yandex = EmailDomain._('yandex.com');

  /// Fastmail.com email domain.
  static const EmailDomain fastmail = EmailDomain._('fastmail.com');

  /// Hey.com email domain.
  static const EmailDomain hey = EmailDomain._('hey.com');

  /// Internal predefined list used to auto-generate the registry.
  static final List<EmailDomain> _predefinedList = [
    gmail,
    yahoo,
    hotmail,
    outlook,
    icloud,
    aol,
    msn,
    mail,
    zoho,
    protonmail,
    gmx,
    live,
    me,
    inbox,
    yandex,
    fastmail,
    hey,
  ];

  /// Internal registry of predefined domains. Keys are the name before `.com`.
  static final Map<String, EmailDomain> _predefinedDomains = {
    for (final domain in _predefinedList)
      domain.domainName.split('.').first.toLowerCase(): domain,
  };

  /// Internal registry of user-added custom domains.
  static final Map<String, EmailDomain> _customDomains = {};

  /// Adds a custom email domain associated with a key.
  ///
  /// Throws an [ArgumentError] if the key already exists.
  static void addCustomDomain(String key, String domain) {
    final lowerKey = key.toLowerCase();
    if (_predefinedDomains.containsKey(lowerKey) ||
        _customDomains.containsKey(lowerKey)) {
      throw ArgumentError('Domain key "$key" already exists in known domains.');
    }
    _customDomains[lowerKey] = EmailDomain.custom(domain);
  }

  /// Retrieves an [EmailDomain] by key.
  ///
  /// Returns predefined or custom domains, or null if not found.
  static EmailDomain? getDomain(String key) {
    final lowerKey = key.toLowerCase();
    return _predefinedDomains[lowerKey] ?? _customDomains[lowerKey];
  }

  /// Returns true if a domain is known (predefined or custom).
  static bool contains(String key) => getDomain(key) != null;

  /// Returns all predefined domain keys (lowercase).
  static Iterable<String> get predefinedKeys => _predefinedDomains.keys;

  /// Returns all custom domain keys (lowercase).
  static Iterable<String> get customKeys => _customDomains.keys;

  /// Returns all known domains (predefined + custom).
  static Iterable<EmailDomain> get allDomains =>
      _predefinedDomains.values.followedBy(_customDomains.values);

  @override
  String toString() => domainName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmailDomain &&
          runtimeType == other.runtimeType &&
          domainName == other.domainName;

  @override
  int get hashCode => domainName.hashCode;
}

/// Internal enum listing predefined email domains.
/// Not intended for public use.
@internal
enum PredefinedEmailDomain {
  gmail,
  yahoo,
  hotmail,
  outlook,
  icloud,
  aol,
  msn,
  mail,
  zoho,
  protonmail,
  gmx,
  live,
  me,
  inbox,
  yandex,
  fastmail,
  hey,
}
