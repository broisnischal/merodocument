import 'package:auto_route/auto_route.dart';
import 'package:merodocument/router/router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: IndexPageRoute.page,
            initial: true,
            path: '/',
            children: [
              AutoRoute(page: HomePageRoute.page),
              AutoRoute(page: RecentPageRoute.page),
              AutoRoute(page: StarredPageRoute.page),
              AutoRoute(page: ProfileScreenRoute.page),
              AutoRoute(page: DocsPageRoute.page),
            ]),
      ];
}
