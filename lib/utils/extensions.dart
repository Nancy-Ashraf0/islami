import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtentions on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this)!;
}
