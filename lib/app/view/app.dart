import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merodocument/core/themes/darktheme.dart';
import 'package:merodocument/core/themes/lighttheme.dart';
import 'package:merodocument/counter/counter.dart';
import 'package:merodocument/l10n/l10n.dart';
import 'package:merodocument/router/router.dart';

final mainRouter = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        // theme: ThemeData(
        //   appBarTheme: AppBarTheme(
        //     backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   ),
        //   useMaterial3: true,
        // ),
        darkTheme: darkTheme,
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: mainRouter.config(),
      ),
    );
  }
}
