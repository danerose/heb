import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:heb/core/config/routes/routes.dart';

import 'package:heb/core/constants/routes.constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon',
      initialRoute: RoutesConstants.initial,
      themeMode: ThemeMode.dark,
      locale: PlatformDispatcher.instance.locale,
      onGenerateRoute: RouteGenerator.generateRoutes,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
