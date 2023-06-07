import 'dart:async';
import 'dart:developer';

import 'app/injector.dart';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:heb/app/app.dart';

import 'package:heb/core/enviroment/env.dev.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (FlutterErrorDetails errorDetails) {
        log(
          errorDetails.library ?? '',
          name: 'RunZonedGuardedFlutterError',
          error: errorDetails.exception,
          stackTrace: errorDetails.stack,
        );
      };
      PlatformDispatcher.instance.onError = (error, stack) {
        log(
          error.toString(),
          name: 'RunZonedGuardedPlatform',
          error: error,
          stackTrace: stack,
        );
        return true;
      };
      await init(DevelopmentEnv());
      runApp(const App());
    },
    (Object error, StackTrace stack) async {
      log(
        error.toString(),
        name: 'RunZonedGuarded',
        error: error,
        stackTrace: stack,
      );
    },
  );
}
