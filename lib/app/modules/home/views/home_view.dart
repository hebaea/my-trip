import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/modules/apartments/controllers/apartments_controller.dart';
import 'package:my_trip/app/modules/city_destinations/controllers/city_destinations_controller.dart';
import 'package:my_trip/app/modules/destination_details/controllers/destination_details_controller.dart';
import 'package:my_trip/app/modules/destinations/controllers/destinations_controller.dart';
import 'package:my_trip/app/modules/home/controllers/home_controller.dart';
import 'package:my_trip/app/modules/home/widgets/ads_item.dart';
import 'package:my_trip/app/modules/home/widgets/category_card.dart';
import 'package:my_trip/app/modules/home/widgets/city_item.dart';
import 'package:my_trip/app/modules/hotels/controllers/hotels_controller.dart';
import 'package:my_trip/app/modules/resorts/controllers/resorts_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final cityController = Get.find<CityDestinationsController>();
  final destinationsController = Get.find<DestinationsController>();
  final resortsController = Get.find<ResortsController>();
  final apartmentsController = Get.find<ApartmentsController>();
  final hotelsController = Get.find<HotelsController>();
  final destinationDetailsController = Get.find<DestinationDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DefaultText(
          'الصفحة الرئيسية',
          color: AppThemeColors.primaryPureWhite,
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: DefaultText(
                  "إكتشف",
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: DefaultText(
                  "وجهات جديدة",
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp,
                  height: 1,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    // RoundedInputField(
                    //   onChanged: (String value) {},
                    //   hintText: 'ابحث عن مكان',
                    //   icon: Icon(
                    //     PhosphorIcons.magnifying_glass,
                    //     size: 20.sp,
                    //     color: AppThemeColors.primaryColor,
                    //   ),
                    // ),
                    // Container(
                    //   height: 48.h,
                    //   width: 48.w,
                    //   decoration: const BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color: AppThemeColors.primaryColor),
                    //   child: Icon(
                    //     PhosphorIcons.funnel_simple,
                    //     size: 32.sp,
                    //     color: AppThemeColors.primaryPureWhite,
                    //   ),
                    // )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Row(
                  children: [
                    DefaultText(
                      "التصنيفات",
                      // "Cities",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Obx(
                      () => controller.isDataLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CategoryCard(
                              image: "assets/images/hotels.jpg",
                              text: "فنادق",
                              onTap: () {
                                hotelsController.getHotelsFromApi(1);
                              },
                            ),
                    ),
                    Obx(() => controller.isDataLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CategoryCard(
                            image: "assets/images/apartments.jpg",
                            text: "شقق",
                            onTap: () {
                              apartmentsController.getApartmentsFromApi(2);
                            },
                          )),
                    Obx(
                      () => controller.isDataLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CategoryCard(
                              image: "assets/images/resorts.jpg",
                              text: "منتجعات",
                              onTap: () {
                                resortsController.getResortsFromApi(3);
                              },
                            ),
                    ),
                    CategoryCard(
                      image: "assets/images/all.jpg",
                      text: "الكل",
                      onTap: () {
                        destinationsController.getDestinationsFromApi();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultText(
                      "الإعلانات",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     destinationsController.getDestinationsFromApi();
                    //   },
                    //   child: DefaultText(
                    //     "الكل",
                    //     fontSize: 20.sp,
                    //     fontWeight: FontWeight.bold,
                    //     color: AppThemeColors.grayPrimary300,
                    //   ),
                    // )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: Obx(
                  () => controller.isDataLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, i) {
                            int? id = 0;
                            try {
                              // id = destinationDetailsController.destinationList[i];
                              // id = destinationsController.destinationList!
                              //     .destination![i].destinationId;
                              id = controller.adsList!.ads![i].destinationId;
                            } catch (e) {
                              id = 0;
                            }
                            final storage = GetStorage();
                            int guestId = storage.read("id");
                            String img = "";
                            try {
                              img = controller.adsList!.ads![i].adsImg!;
                            } catch (e) {
                              img = "";
                            }
                            return AdsItem(
                              context: context,
                              link: img,
                              onTap: () {
                                destinationDetailsController
                                    .getDestinationDetails(id!, guestId);
                              },
                              // location: "بنغازي , درنة",
                              // place: "فندق الصفوة",
                            );
                            // AdsItem(
                            //   link: "assets/1.webp",
                            //   context: context,
                            //   place: "فندق الودان",
                            //   location: 'طرابلس , الظهرة',
                            // )
                          },
                          itemCount: controller.adsList?.ads!.length,
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Row(
                  children: [
                    DefaultText(
                      "إلى أين تريد أن تذهب؟",
                      // "Cities",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 230,
                width: double.infinity,
                child: Obx(
                  () => controller.isDataLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, i) {
                            String name = "";
                            try {
                              name = controller.cityList!.city[i].cityName!;
                            } catch (e) {
                              name = "";
                            }

                            int id = 0;
                            try {
                              id = controller.cityList!.city[i].cityId!;
                            } catch (e) {
                              id = 0;
                            }
                            String cityImg = '';
                            try {
                              cityImg = controller.cityList!.city[i].cityImg!;
                            } catch (e) {
                              cityImg = '';
                            }

                            return CityItem(
                              context: context,
                              link: cityImg,
                              place: name,
                              onTap: () {
                                cityController.getCityDestinations(id);
                              },
                            );
                          },
                          itemCount: controller.cityList?.city.length,
                        ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
