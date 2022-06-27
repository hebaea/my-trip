import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/modules/destination_details/controllers/destination_details_controller.dart';
import 'package:my_trip/app/modules/destinations/controllers/destinations_controller.dart';
import 'package:my_trip/app/modules/destinations/widgets/destination_list_tile.dart';

class Destinations extends GetView<DestinationsController> {
  Destinations({Key? key}) : super(key: key);

  @override
  final controller = Get.find<DestinationsController>();
  final destinationDetailsController = Get.find<DestinationDetailsController>();

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
                        controller.destinationList!.destination![i].ownerName!;
                  } catch (e) {
                    name = "";
                  }
                  String address = "";
                  try {
                    address = controller
                        .destinationList!.destination![i].destinationAddress!;
                  } catch (e) {
                    address = "";
                  }
                  int? id = 0;
                  try {
                    // id = destinationDetailsController.destinationList[i];
                    id = controller
                        .destinationList!.destination![i].destinationId;
                  } catch (e) {
                    id = 0;
                  }

                  return Column(
                    children: [
                      SizedBox(height: 20.h),
                      DestinationListTile(
                        ontap: () {
                          destinationDetailsController
                              .getDestinationDetails(id!);
                        },
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
                itemCount: controller.destinationList!.destination!.length,
              ),
      ),
    );
  }
}
