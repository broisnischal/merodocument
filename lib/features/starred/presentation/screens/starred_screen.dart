import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merodocument/core/constants/color_const.dart';

@RoutePage(name: 'StarredPageRoute')
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Shared Documents',
      //     style: GoogleFonts.inter(
      //       fontSize: 14.sp,
      //       fontWeight: FontWeight.w600,
      //       color: ColorConst.blackColor,
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            50.verticalSpace,
            Text(
              'Share with a link',
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: ColorConst.blackColor,
              ),
            ),
            10.verticalSpace,
            Text(
              'Anyone with the link can view.\nNo Sign-in required.',
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                color: ColorConst.blackColor,
              ),
            ),
            20.verticalSpace,
            Container(
              decoration: BoxDecoration(
                // color: ColorConst.blackColor.withOpacity(.03),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: ColorConst.blackColor.withOpacity(.2),
                  width: 1.sp,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Row(
                children: [
                  10.horizontalSpace,
                  Icon(
                    Icons.link_rounded,
                    color: ColorConst.blackColor,
                    size: 20.sp,
                  ),
                  10.horizontalSpace,
                  Text(
                    'https://merodocument.com/0ff32a',
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: ColorConst.blackColor,
                    ),
                  ),
                ],
              ),
            ),
            10.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConst.blackColor,
                      foregroundColor: ColorConst.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                    ),
                    onPressed: () {},
                    child: const Text('Copy Link'),
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConst.blackColor.withOpacity(0.02),
                      elevation: 0,
                      side: BorderSide(
                        color: ColorConst.blackColor.withOpacity(.2),
                        width: 1.sp,
                      ),
                      foregroundColor: ColorConst.blackColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                    ),
                    onPressed: () {},
                    child: const Text('Share Link'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
