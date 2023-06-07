import 'package:flutter/material.dart';
import 'package:heb/core/constants/routes.constants.dart';

import 'package:heb/app/presentation/views/home/home.view.dart';
import 'package:heb/app/presentation/views/splash/splash.view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstants.initial:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RoutesConstants.initial),
          builder: (BuildContext context) {
            return const SplashView();
          },
        );
      case RoutesConstants.home:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RoutesConstants.home),
          builder: (BuildContext context) {
            return const HomeView();
          },
        );
      default:
        return _error();
    }
  }

  static Route<dynamic> _error() {
    return MaterialPageRoute(
      builder: (BuildContext _) {
        return const Scaffold(
          body: Center(
            child: Text('Error, Page not found'),
          ),
        );
      },
    );
  }
}
