import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/modules/destinations/widgets/destination_list_tile.dart';
import 'package:my_trip/app/routes/app_pages.dart';

import '../controllers/hotels_controller.dart';

class HotelsView extends GetView<HotelsController> {
  const HotelsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        // appBar: AppBar(
        //   title: const DefaultText(
        //     'فنادق',
        //     color: AppThemeColors.primaryPureWhite,
        //   ),
        //   centerTitle: true,
        // ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: controller.destinationList?.destianation == null
              ? const Center(child: DefaultText('something went wrong'))
              : Obx(
                  () => controller.isDataLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemBuilder: (ctx, i) {
                            String name = "";
                            try {
                              name = controller
                                  .destinationList!.destianation![i].ownerName!;
                            } catch (e) {
                              name = "";
                            }
                            String address = "";
                            try {
                              address = controller.destinationList!
                                  .destianation![i].destinationAddress!;
                            } catch (e) {
                              address = "";
                            }

                            return Column(
                              children: [
                                SizedBox(height: 20.h),
                                DestinationListTile(
                                  ontap: () =>
                                      Get.toNamed(Routes.DESTINATION_DETAILS),
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
                          itemCount:
                              controller.destinationList!.destianation!.length,
                        ),
                ),
        ));
  }
}
