import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merodocument/core/constants/color_const.dart';
import 'package:merodocument/gen/assets.gen.dart';

@RoutePage(name: 'RecentPageRoute')
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Documents',
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: ColorConst.blackColor,
          ),
        ),
        // centerTitle: true,
        actions: [
          // SvgPicture.asset(
          //   MyAssets.svgs.home.path,
          //   width: 24.sp,
          // ),

          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.filter_list,
              color: ColorConst.blackColor,
            ),
          ),
          20.horizontalSpace,
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            child: TextField(
              onTapOutside: (context) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              decoration: InputDecoration(
                hintText: 'Search your document here',
                prefixIcon: const Icon(
                  Icons.search,
                ),
                filled: true,
                fillColor: ColorConst.blackColor.withOpacity(0.02),
                hintStyle: TextStyle(
                  color: ColorConst.blackColor.withOpacity(.7),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    color: ColorConst.blackColor.withOpacity(0.1),
                  ),
                  gapPadding: 0,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10.sp),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    color: ColorConst.blackColor.withOpacity(0.1),
                  ),
                  gapPadding: 0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                    color: ColorConst.blackColor.withOpacity(0.2),
                    style: BorderStyle.none,
                  ),
                  gapPadding: 0,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                TabBar(
                  controller: tabController,
                  tabs: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 12.h,
                      ),
                      child: const Text('All'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 12.h,
                      ),
                      child: const Text('Files'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 12.h,
                      ),
                      child: const Text('Images'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 12.h,
                      ),
                      child: const Text('Shared'),
                    ),
                  ],
                  labelColor: ColorConst.blackColor,
                  unselectedLabelColor: ColorConst.blackColor.withOpacity(.5),
                  dividerColor: ColorConst.blackColor.withOpacity(.1),
                  indicatorColor: ColorConst.blackColor,

                  // indicator: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(12),
                  //   color: ColorConst.red,
                  // ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      RefreshIndicator(
                        onRefresh: () async {},
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Container(
                                height: 36.sp,
                                width: 36.sp,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color:
                                      ColorConst.blackColor.withOpacity(0.03),
                                ),
                                padding: EdgeInsets.all(8.sp),
                                child: SvgPicture.asset(
                                  MyAssets.svgs.pdf2.path,
                                  width: 16.sp,
                                ),
                              ),
                              title: Text(
                                'Company Overview 202$index',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: const Text('Last opened 3 days ago'),
                              onTap: () {},
                              trailing: const Icon(Icons.more_vert),
                            );
                          },
                          itemCount: 20,
                        ),
                      ),
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Container(
                              height: 36.sp,
                              width: 36.sp,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: ColorConst.blackColor.withOpacity(0.03),
                              ),
                              padding: EdgeInsets.all(8.sp),
                              child: SvgPicture.asset(
                                MyAssets.svgs.pdf.path,
                                width: 16.sp,
                              ),
                            ),
                            title: Text('Citizenship Certificate ${index + 1}'),
                            subtitle: const Text('Modified 15 min ago'),
                            onTap: () {},
                            trailing: const Icon(Icons.more_vert),
                          );
                        },
                        itemCount: 20,
                      ),
                      const Center(
                        child: Text('Pdfs'),
                      ),
                      const Center(
                        child: Text('Shared'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
