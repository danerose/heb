import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:heb/core/config/theme/theme.dart';
import 'package:heb/core/config/routes/routes.dart';
import 'package:heb/core/constants/routes.constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon',
      initialRoute: RoutesConstants.initial,
      themeMode: ThemeMode.system,
      theme: CustomTheme.light(),
      darkTheme: CustomTheme.dark(),
      locale: PlatformDispatcher.instance.locale,
      onGenerateRoute: RouteGenerator.generateRoutes,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
