import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/modules/destinations/widgets/destination_list_tile.dart';

import '../../../routes/app_pages.dart';

class Distinations extends StatelessWidget {
  const Distinations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            DestinationListTile(
                ontap: () => Get.toNamed(Routes.DESTINATION_DETAILS),
                height: height,
                width: width,
                image: "assets/images/destination1.jpeg",
                text: "اسم المكان "),
            SizedBox(height: width * 0.04),
            DestinationListTile(
                ontap: () => Get.toNamed(Routes.DESTINATION_DETAILS),
                height: height,
                width: width,
                image: "assets/images/destination2.jpeg",
                text: "فندق الودان"),
            SizedBox(height: width * 0.04),
            DestinationListTile(
                ontap: () => Get.toNamed(Routes.DESTINATION_DETAILS),
                height: height,
                width: width,
                image: "assets/images/destination3.jpeg",
                text: "فندق الصفوة"),
            SizedBox(height: width * 0.04),
            DestinationListTile(
                ontap: () => Get.toNamed(Routes.DESTINATION_DETAILS),
                height: height,
                width: width,
                image: "assets/images/destination4.jpeg",
                text: "منتجع سياحي القويعة"),
          ],
        ),
      ),
    );
  }
}
