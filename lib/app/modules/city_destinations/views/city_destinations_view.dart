import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/modules/destination_details/controllers/destination_details_controller.dart';
import 'package:my_trip/app/modules/destinations/widgets/destination_list_tile.dart';
import 'package:my_trip/app/routes/app_pages.dart';
import '../controllers/city_destinations_controller.dart';

class CityDestinationsView extends GetView<CityDestinationsController> {
  CityDestinationsView({Key? key}) : super(key: key);
  final destinationDetailsController = Get.find<DestinationDetailsController>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(controller.isDataLoading.value);
    print('    print(controller.destinationList?.destination);');

    return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: controller.destinationList?.destination == []
              ? const Center(child: DefaultText('لا وجهات لهذه المدينة'))
              : Obx(
                  () => controller.isDataLoading.value == true
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemBuilder: (ctx, i) {
                            String name = "";
                            try {
                              name = controller
                                  .destinationList!.destination![i].ownerName!;
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
                              id = controller.destinationList!.destination![i]
                                  .destinationId;
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
                                      "${controller.destinationList!.destination![i].destinationImg}",

                                  text: name,
                                  address: address,
                                  // "اسم المكان "
                                ),
                                // SizedBox(height: width * 0.04),
                              ],
                            );
                          },
                          itemCount:
                              controller.destinationList?.destination?.length,
                        ),
                ),
        ));
  }
}
