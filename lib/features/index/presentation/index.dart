import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merodocument/core/constants/color_const.dart';
import 'package:merodocument/router/router.gr.dart';

@RoutePage(name: 'IndexPageRoute')
class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ColorConst.whiteColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    final routes = <PageRouteInfo<dynamic>>[
      const HomePageRoute(),
      const RecentPageRoute(),
      const DocsPageRoute(),
      const StarredPageRoute(),
      const ProfileScreenRoute(),
    ];

    return AutoTabsRouter(
      curve: Curves.easeInOut,
      routes: routes,
      builder: (context, child) {
        final tabRouter = AutoTabsRouter.of(context);

        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: ColorConst.whiteColor,
          // appBar: AppBar(
          //   backgroundColor: ColorConst.whiteColor,
          //   // title: Text(tabRouter.current.name),
          //   centerTitle: true,
          // ),
          body: SafeArea(child: child),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: ColorConst.blackColor.withOpacity(0.1),
                ),
              ),
            ),
            child: NavigationBarTheme(
              data: NavigationBarThemeData(
                // height: kBottomNavigationBarHeight,
                indicatorColor: ColorConst.transparent,

                labelTextStyle: WidgetStateProperty.all(
                  GoogleFonts.roboto(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                indicatorShape: const BeveledRectangleBorder(),
              ),
              child: NavigationBar(
                indicatorShape: ShapeBorder.lerp(
                  const BeveledRectangleBorder(),
                  const StadiumBorder(),
                  3,
                ),
                // shadowColor: ColorConst.blackColor,
                // labelBehavior:
                //     NavigationDestinationLabelBehavior.onlyShowSelected,
                selectedIndex: tabRouter.activeIndex,
                onDestinationSelected: tabRouter.setActiveIndex,
                animationDuration: const Duration(milliseconds: 300),
                // height: kBottomNavigationBarHeight,
                elevation: 0,
                backgroundColor: ColorConst.whiteColor,
                indicatorColor: ColorConst.transparent,
                destinations: const [
                  NavigationDestination(
                    selectedIcon: Icon(Icons.home_rounded),
                    icon: Icon(Icons.home_outlined),
                    label: 'Home',
                    tooltip: 'Homee',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(Icons.search_sharp),
                    icon: Icon(Icons.search_outlined),
                    label: 'Search',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(Icons.document_scanner_rounded),
                    icon: Icon(Icons.document_scanner_outlined),
                    label: 'Docs',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(Icons.share),
                    icon: Icon(Icons.share_outlined),
                    label: 'Shared',
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(Icons.person),
                    icon: Icon(Icons.person_outline),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
          // bottomNavigationBar: BottomAppBar(
          //   // height: kBottomNavigationBarHeight,
          //   // elevation: 0,
          //   // notchMargin: 10,
          //   padding: EdgeInsets.zero,
          //   color: Colors.transparent,
          //   // shape: const CircularNotchedRectangle(),
          //   child: BottomNavigationBar(
          //     type: BottomNavigationBarType.fixed,
          //     landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          //     onTap: tabRouter.setActiveIndex,
          //     items: const [
          //       BottomNavigationBarItem(
          //         tooltip: 'Home',
          //         activeIcon: Icon(Icons.abc_rounded),
          //         icon: Icon(Icons.home),
          //         label: 'Home',
          //       ),
          //       BottomNavigationBarItem(
          //         icon: Icon(Icons.history),
          //         label: 'Recent',
          //       ),
          //       BottomNavigationBarItem(
          //         icon: Icon(Icons.star),
          //         label: 'Starred',
          //       ),
          //     ],
          //   ),
          // ),
        );
      },
    );
  }
}
