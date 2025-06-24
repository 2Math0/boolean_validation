# Project Commands

## Initial Setup

```bash
# Create a new Flutter project
flutter create example

# Navigate to example directory
cd example

# Create necessary directories
mkdir -p lib/screens lib/widgets lib/utils lib/theme lib/models lib/services lib/l10n
```

## Dependencies

```bash
# Add dependencies to pubspec.yaml
flutter pub add flutter_localizations --sdk=flutter
flutter pub add boolean_validation
flutter pub add animate_do
```

## Localization Setup

```bash
# Add to pubspec.yaml under flutter: section
# generate: true

# Create l10n.yaml file in root directory with content:
# arb-dir: lib/l10n
# template-arb-file: app_en.arb
# output-localization-file: app_localizations.dart
# output-class: AppLocalizations

# Generate localization files
flutter gen-l10n

# Watch l10n changes and auto-generate files
flutter gen-l10n --watch

# Extract ARB strings from code (if using intl_utils)
dart run intl_utils:generate

# Generate ARB template from existing strings
dart run intl_utils:extract_to_arb --output-dir=lib/l10n lib/*.dart
```

## Development

```bash
# Run the app in debug mode
flutter run -d web

# Run the app in release mode
flutter run --release

# Clean the project
flutter clean

# Get dependencies
flutter pub get

# Update dependencies
flutter pub upgrade

# Format code
flutter format .

# Analyze code
flutter analyze
```

## Building

```bash
# Build web
flutter build web --wasm
```

## Git Commands

```bash
# Initialize git
git init

# Add all files
git add .

# Commit changes
git commit -m "Initial commit"

# Create and switch to new branch
git checkout -b feature/validation-form
```

## VSCode Extensions

Recommended extensions for better development experience:
- Flutter
- Dart
- Flutter Intl
- Better Comments
- Error Lens
- Git Lens