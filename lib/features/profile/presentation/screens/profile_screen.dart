import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merodocument/core/constants/color_const.dart';

@RoutePage(name: 'ProfileScreenRoute')
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Settings',
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: ColorConst.blackColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Text(
              'Personal Information',
              style: GoogleFonts.notoSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: ColorConst.blackColor,
              ),
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Name',
                  style: GoogleFonts.notoSans(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    // color: ColorConst.blackColor.withOpacity(0.5),
                  ),
                ),
                20.horizontalSpace,
                Text(
                  'Nischal Dahal',
                  style: GoogleFonts.notoSans(
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Username',
                  style: GoogleFonts.notoSans(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,

                    // color: ColorConst.blackColor.withOpacity(0.5),
                  ),
                ),
                20.horizontalSpace,
                Text(
                  'broisnischal',
                  style: GoogleFonts.notoSans(
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Email',
                  style: GoogleFonts.notoSans(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                20.horizontalSpace,
                Text(
                  'info@nischal-dahal.com.np',
                  style: GoogleFonts.notoSans(
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Phone',
                  style: GoogleFonts.notoSans(
                    // color: ColorConst.blackColor.withOpacity(0.5),
                    fontWeight: FontWeight.w500,

                    fontSize: 14.sp,
                  ),
                ),
                20.horizontalSpace,
                Text(
                  '+977 9812345678',
                  style: GoogleFonts.notoSans(
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            30.verticalSpace,
            Text(
              'Security & Privacy',
              style: GoogleFonts.notoSans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: ColorConst.blackColor,
              ),
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Two Factor Authentication',
                  style: GoogleFonts.notoSans(
                    fontSize: 14.sp,
                  ),
                ),
                20.horizontalSpace,
                // const Icon(
                //   Icons.arrow_circle_right,
                // ),
              ],
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Change Password',
                  style: GoogleFonts.notoSans(
                    fontSize: 14.sp,
                  ),
                ),
                20.horizontalSpace,
                // const Icon(
                //   Icons.arrow_circle_right,
                // ),
              ],
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Default Folder privacy',
                  style: GoogleFonts.notoSans(
                    fontSize: 14.sp,
                  ),
                ),
                20.horizontalSpace,
                // const Icon(
                //   Icons.arrow_circle_right,
                // ),
              ],
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'App Locker',
                  style: GoogleFonts.notoSans(
                    fontSize: 14.sp,
                  ),
                ),
                20.horizontalSpace,
                // const Icon(
                //   Icons.arrow_circle_right,
                // ),
              ],
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trash',
                  style: GoogleFonts.notoSans(
                    fontSize: 14.sp,
                  ),
                ),
                20.horizontalSpace,
                // const Icon(
                //   Icons.arrow_circle_right,
                // ),
              ],
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
