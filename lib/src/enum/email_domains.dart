class EmailDomain {
  final String domain;

  // Private constructor to prevent direct instantiation
  const EmailDomain._(this.domain);

  // Predefined domains
  static const EmailDomain gmail = EmailDomain._('gmail.com');
  static const EmailDomain yahoo = EmailDomain._('yahoo.com');
  static const EmailDomain hotmail = EmailDomain._('hotmail.com');
  static const EmailDomain outlook = EmailDomain._('outlook.com');

  // Allows developers to create custom domains
  static EmailDomain custom(String customDomain) => EmailDomain._(customDomain);
}
