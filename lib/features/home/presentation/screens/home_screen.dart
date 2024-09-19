import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merodocument/core/constants/color_const.dart';
import 'package:merodocument/gen/assets.gen.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

@RoutePage(name: 'HomePageRoute')
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> data = [
    'Personal',
    'Government',
    'Company',
    'Others',
  ];

  Widget buildItem(String text) {
    return Card(
      color: ColorConst.blackColor.withOpacity(.03),
      elevation: 0,
      margin: EdgeInsets.zero,
      borderOnForeground: false,
      clipBehavior: Clip.antiAlias,
      key: ValueKey(text),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.folder_outlined,
              color: ColorConst.blackColor,
              size: 35.sp,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }

  Widget buildUpload(String text, IconData icon, double size) {
    return Card(
      color: ColorConst.blackColor.withOpacity(.03),
      elevation: 0,
      margin: EdgeInsets.zero,
      borderOnForeground: false,
      clipBehavior: Clip.antiAlias,
      key: ValueKey(text),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: ColorConst.blackColor,
              size: size.sp,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.whiteColor,
      // appBar: AppBar(
      //   title: Text(
      //     'Mero Documents',
      //     style: GoogleFonts.inter(
      //       fontSize: 16.sp,
      //       fontWeight: FontWeight.w700,
      //     ),
      //   ),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: ColorConst.whiteColor,
            // pinned: true,
            // floating: true,
            // snap: true,
            centerTitle: false,
            title: Text(
              'Mero Documents',
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          // 20.verticalSpace,
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(12.sp),
                  child: ReorderableGridView.count(
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    crossAxisCount: 3,
                    addRepaintBoundaries: false,
                    addSemanticIndexes: false,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    onDragStart: (_) {
                      print('drag start');
                    },
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        final element = data.removeAt(oldIndex);
                        data.insert(newIndex, element);
                      });
                    },
                    footer: [
                      if (data.length < 6)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              data.add('Folder ${data.length + 1}');
                            });
                          },
                          child: Card(
                            color: ColorConst.blackColor.withOpacity(.02),
                            elevation: 0,
                            key: const ValueKey('Footer'),
                            child: const Center(
                              child: Icon(Icons.add),
                            ),
                          ),
                        ),
                    ],
                    children: data.map(buildItem).toList(),
                  ),
                ),
                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.all(12.sp),
                  child: Text(
                    'Recently Added Documents',
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                10.verticalSpace,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(8, (index) {
                      return Container(
                        margin: index == 0
                            ? EdgeInsets.only(left: 12.sp, right: 10.sp)
                            : EdgeInsets.only(right: 10.sp),
                        width: 150,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: ColorConst.blackColor.withOpacity(0.2),
                          ),
                          color: ColorConst.blackColor.withOpacity(0.02),
                        ),
                        child: const Center(
                          child: Text('Sales Deed', style: TextStyle()),
                        ),
                      );
                    }),
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding: EdgeInsets.all(12.sp),
                  child: Text(
                    'Currently Shared Documents',
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                5.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.sp),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onLongPress: () {
                          showModalBottomSheet(
                            backgroundColor: ColorConst.whiteColor,
                            isScrollControlled: true,
                            showDragHandle: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            context: context,
                            builder: (builder) {
                              return Container(
                                height: 200,
                                color: ColorConst.whiteColor,
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: const Text('Copy Document Code'),
                                      leading: SvgPicture.asset(
                                        MyAssets.svgs.pdf2.path,
                                        width: 20.sp,
                                        height: 20.sp,
                                      ),
                                    ),
                                    ListTile(
                                      title: const Text('Cancel Sharing'),
                                      leading: SvgPicture.asset(
                                        MyAssets.svgs.pdf2.path,
                                        width: 20.sp,
                                        height: 20.sp,
                                      ),
                                    ),
                                    ListTile(
                                      title: const Text('Delete Document'),
                                      leading: SvgPicture.asset(
                                        MyAssets.svgs.pdf2.path,
                                        width: 20.sp,
                                        height: 20.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10.sp),
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: ColorConst.blackColor.withOpacity(0.2),
                            ),
                            color: ColorConst.blackColor.withOpacity(0.02),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Sales Deed',
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                'Expires in 3 day',
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => Dialog(
              backgroundColor: ColorConst.whiteColor,
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: SizedBox(
                  // height: 200.sp,
                  width: 200.sp,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.sp,
                      crossAxisSpacing: 8.sp,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) => Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: ColorConst.blackColor.withOpacity(0.2),
                          ),
                          color: ColorConst.blackColor.withOpacity(0.02),
                        ),
                        child: buildUpload(
                          'Upload PDF',
                          Icons.photo_camera,
                          20.sp,
                        ),
                      ),
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                  ),
                ),
              ),
            ),
          );
        },
        // mini: true,
        backgroundColor: ColorConst.blackColor,
        child: Padding(
          padding: EdgeInsets.all(8.sp),
          child: const Icon(
            Icons.upload_file_rounded,
            color: ColorConst.whiteColor,
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
