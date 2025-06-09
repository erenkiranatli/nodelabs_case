import 'package:nodelabs_case/l10n/gen_l10n/app_localizations.dart';

class LocalizationService {
  static late AppLocalizations _localizations;

  static void setLocalization(AppLocalizations localizations) {
    _localizations = localizations;
  }

  static AppLocalizations get current => _localizations;
}
