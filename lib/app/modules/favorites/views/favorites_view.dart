import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/modules/destination_details/controllers/destination_details_controller.dart';
import 'package:my_trip/app/modules/destinations/widgets/destination_list_tile.dart';
import '../controllers/favorites_controller.dart';

class FavoritesView extends GetView<FavoritesController> {
  FavoritesView({Key? key}) : super(key: key);
  final destinationDetailsController = Get.find<DestinationDetailsController>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    controller.get();

    return Scaffold(
      body: controller.favoritesList.value != []
          ? Container(
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
                            name = controller
                                .favoriteList!.destination![i].destinationName!;
                          } catch (e) {
                            name = "";
                          }
                          String address = "";
                          try {
                            address = controller.favoriteList!.destination![i]
                                .destinationAddress!;
                          } catch (e) {
                            address = "";
                          }
                          int? id = 0;
                          try {
                            // id = destinationDetailsController.destinationList[i];
                            id = controller
                                .favoriteList?.destination![i].destinationId;
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
                                    "${controller.favoritesList[i].destinationImg}",
                                text: name,
                                address: address,
                                // "اسم المكان "
                              ),
                              // SizedBox(height: width * 0.04),
                            ],
                          );
                        },
                        itemCount: controller.favoritesList.length,
                      ),
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/empty_favorite.svg",
                    height: 100.h,
                    width: 109.w,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  DefaultText(
                    "قائمة المفضلة فارغة",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  const DefaultText(
                    " اي كلام هنا اي كلام هنا اي كلام هنا اي كلام هنا اي كلام هنا اي كلام هنا ",
                    color: AppThemeColors.grayPrimary400,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
    );
  }
}
