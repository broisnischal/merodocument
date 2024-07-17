// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:merodocument/features/docs/presentation/screens/docs_screen.dart'
    as _i1;
import 'package:merodocument/features/home/presentation/screens/home_screen.dart'
    as _i2;
import 'package:merodocument/features/index/presentation/index.dart' as _i6;
import 'package:merodocument/features/profile/presentation/screens/profile_screen.dart'
    as _i4;
import 'package:merodocument/features/recent/presentation/screens/recent_screen.dart'
    as _i5;
import 'package:merodocument/features/starred/presentation/screens/starred_screen.dart'
    as _i3;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    DocsPageRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DocsScreen(),
      );
    },
    HomePageRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    StarredPageRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    RecentPageRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeScreen(),
      );
    },
    IndexPageRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.IndexPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.DocsScreen]
class DocsPageRoute extends _i7.PageRouteInfo<void> {
  const DocsPageRoute({List<_i7.PageRouteInfo>? children})
      : super(
          DocsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'DocsPageRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomePageRoute extends _i7.PageRouteInfo<void> {
  const HomePageRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class StarredPageRoute extends _i7.PageRouteInfo<void> {
  const StarredPageRoute({List<_i7.PageRouteInfo>? children})
      : super(
          StarredPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'StarredPageRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeScreen]
class ProfileScreenRoute extends _i7.PageRouteInfo<void> {
  const ProfileScreenRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ProfileScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileScreenRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomeScreen]
class RecentPageRoute extends _i7.PageRouteInfo<void> {
  const RecentPageRoute({List<_i7.PageRouteInfo>? children})
      : super(
          RecentPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecentPageRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.IndexPage]
class IndexPageRoute extends _i7.PageRouteInfo<void> {
  const IndexPageRoute({List<_i7.PageRouteInfo>? children})
      : super(
          IndexPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'IndexPageRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
