import 'dart:async';
import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merodocument/core/themes/darktheme.dart';
import 'package:merodocument/core/themes/lighttheme.dart';
import 'package:merodocument/l10n/l10n.dart';
import 'package:merodocument/router/router.dart';
import 'package:merodocument/router/router.gr.dart';

final mainRouter = AppRouter();
final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // final _navigatorKey = GlobalKey<NavigatorState>();
  StreamSubscription<Uri>? _linkSubscription;
  late AppLinks _appLinks;

  @override
  void initState() {
    super.initState();

    initDeepLinks();
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();

    super.dispose();
  }

  Future<void> initDeepLinks() async {
    _appLinks = AppLinks();

    // Handle links
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      debugPrint('onAppLink: $uri');
      openAppLink(uri);
    });
  }

  void openAppLink(Uri uri) {
    // Check if the URI is for '/products'
    if (uri.path == '/products') {
      // Show the modal bottom sheet here

      // Push the '/products' route
      // _navigatorKey.currentState?.pushNamed(uri.path);
    } else if (uri.path == '/cart') {
      mainRouter.push(ProfileScreenRoute());
    } else {
      // Handle other URIs
      mainRouter.pushNamed(uri.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        key: _navigatorKey,
        // onNavigationNotification: (NavigationNotification notification) {
        //   return true;
        // },
        // theme: ThemeData(
        //   appBarTheme: AppBarTheme(
        //     backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   ),
        //   useMaterial3: true,
        // ),
        darkTheme: darkTheme,
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate, // Your app-specific localizations delegate
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        routerDelegate: AutoRouterDelegate(
          mainRouter,
          placeholder: (context) => Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          deepLinkBuilder: (deepLink) {
            log('Received deep link: ${deepLink.path}');

            if (deepLink.path.isNotEmpty) {
              // Handle specific paths
              if (deepLink.path.startsWith('/products')) {
                // You can show a bottom sheet here or navigate to the products route
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const Text('Products'),
                  );
                });
                return DeepLink.path('/products');
              } else if (deepLink.path == '/cart') {
                // Similar handling for the cart
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const Text('Cart'),
                  );
                });
                return DeepLink.path('/products');
              }
            }

            // Fallback to a default path if no matches found
            return deepLink.path.isEmpty ? DeepLink.defaultPath : deepLink;
          },
        ),
        routeInformationParser: mainRouter.defaultRouteParser(
          includePrefixMatches: true,
        ),
      ),
    );
  }
}

class ProductBottomSheet extends StatelessWidget {
  const ProductBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Product Details',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Here are the details for the product.',
            style: TextStyle(fontSize: 16),
          ),
          // Add more widgets here as needed
        ],
      ),
    );
  }
}
