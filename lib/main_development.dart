import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:merodocument/app/app.dart';
import 'package:merodocument/bootstrap.dart';
import 'package:merodocument/di/injection_config.dart';
import 'package:merodocument/utils/logger.dart';

void main() async {
  // bootstrap(() => const App());
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      DartPluginRegistrant.ensureInitialized();

      // await Firebase.initializeApp(
      //   name: 'vms_client_dev',
      //   options: DefaultFirebaseOptions.currentPlatform,
      // );

      FlutterError.onError = (FlutterErrorDetails details) {
        // developer.log(
        //   'Flutter Error: ${details.exceptionAsString()}',
        //   name: 'FlutterError',
        //   level: 1000,
        //   // stackTrace: details.stack,
        // );

        // developer.log('Error: ${details.exception}', stackTrace: details.stack);

        // Report error to Firebase Crashlytics
        // FirebaseCrashlytics.instance.recordFlutterFatalError(details);
      };

      // PlatformDispatcher.instance.onError = (error, stack) {
      //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      //   return true;
      // };

      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      Bloc.observer = const AppBlocObserver();

      // AppService().startService();

      configureDependencies(Env.development);

      // await FirebaseApi().init();

      // await initBackgroundService();

      try {
        await FlutterDisplayMode.setHighRefreshRate();
      } catch (e) {
        logger.d(e.toString());
      }

      runApp(const App());
    },
    (error, stackTrace) => logger.e(error.toString(), stackTrace: stackTrace),
  );
}
