import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/modules/destination_details/controllers/destination_details_controller.dart';
import 'package:my_trip/app/modules/destinations/controllers/destinations_controller.dart';
import 'package:my_trip/app/modules/destinations/widgets/destination_list_tile.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Destinations extends GetView<DestinationsController> {
  Destinations({Key? key}) : super(key: key);

  @override
  final controller = Get.find<DestinationsController>();
  final destinationDetailsController = Get.find<DestinationDetailsController>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: controller.destinationList!.destination!.isEmpty
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/emptyalldestination.svg",
                        height: 100.h,
                        width: 109.w,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      DefaultText(
                        "لا يوجد وجهات حتى الأن",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      const DefaultText(
                        "عند إضافة وجهات ستظهر هنا",
                        color: AppThemeColors.grayPrimary400,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            : Obx(
                () => controller.isDataLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemBuilder: (ctx, i) {
                          String name = "";
                          try {
                            name = controller.destinationList!.destination![i]
                                .destinationName!;
                          } catch (e) {
                            name = "";
                          }
                          String address = "";
                          try {
                            address = controller.destinationList!
                                .destination![i].destinationAddress!;
                          } catch (e) {
                            address = "";
                          }
                          int? id = 0;
                          try {
                            id = controller
                                .destinationList!.destination![i].destinationId;
                          } catch (e) {
                            id = 0;
                          }
                          final storage = GetStorage();
                          int guestId = storage.read("id");

                          return Column(
                            children: [
                              SizedBox(height: 20.h),
                              DestinationListTile(
                                ontap: () {
                                  destinationDetailsController
                                      .getDestinationDetails(id!, guestId);
                                },
                                height: height,
                                width: width,
                                image:
                                    '${controller.destinationList!.destination![i].destinationImg}',
                                text: name,
                                address: address,
                              ),
                              // SizedBox(height: width * 0.04),
                            ],
                          );
                        },
                        itemCount:
                            controller.destinationList?.destination?.length,
                      ),
              ),
      ),
    );
  }
}
