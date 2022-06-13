import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/modules/destinations/controllers/destinations_controller.dart';
import 'package:my_trip/app/modules/destinations/widgets/destination_list_tile.dart';

import '../../../routes/app_pages.dart';

class Distinations extends GetView<DestinationsController> {
  Distinations({Key? key}) : super(key: key);
  @override
  final controller = Get.find<DestinationsController>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Obx(
        () => controller.isDataLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (ctx, i) {
                  String name = "";
                  try {
                    name =
                        controller.destinationList!.destianation![i].ownerName!;
                  } catch (e) {
                    name = "";
                  }
                  String address = "";
                  try {
                    address = controller
                        .destinationList!.destianation![i].destinationAddress!;
                  } catch (e) {
                    address = "";
                  }

                  return Column(
                    children: [
                      SizedBox(height: 20.h),
                      DestinationListTile(
                        ontap: () => Get.toNamed(Routes.DESTINATION_DETAILS),
                        height: height,
                        width: width,
                        image: "assets/images/destination1.jpeg",
                        text: name,
                        address: address,
                        // "اسم المكان "
                      ),
                      // SizedBox(height: width * 0.04),
                    ],
                  );
                },
                itemCount: controller.destinationList!.destianation!.length,
              ),
      ),
    );
  }
}
