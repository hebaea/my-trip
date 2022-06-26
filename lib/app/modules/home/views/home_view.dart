import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/global_widgets/rounded_input_field.dart';
import 'package:my_trip/app/modules/city_destinations/controllers/city_destinations_controller.dart';
import 'package:my_trip/app/modules/home/controllers/home_controller.dart';
import 'package:my_trip/app/modules/home/widgets/ads_item.dart';
import 'package:my_trip/app/modules/home/widgets/city_item.dart';
import 'package:my_trip/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final cityController = Get.find<CityDestinationsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  children: [
                    RoundedInputField(
                      onChanged: (String value) {},
                      hintText: 'ابحث عن مكان',
                      icon: Icon(
                        PhosphorIcons.magnifying_glass,
                        size: 20.sp,
                        color: AppThemeColors.primaryColor,
                      ),
                    ),
                    Container(
                      height: 48.h,
                      width: 48.w,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppThemeColors.primaryColor),
                      child: Icon(
                        PhosphorIcons.funnel_simple,
                        size: 32.sp,
                        color: AppThemeColors.primaryPureWhite,
                      ),
                    )
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
                      "الوجهات المميزة",
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.DESTINATIONS);
                      },
                      child: DefaultText(
                        "الكل",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppThemeColors.grayPrimary300,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    AdsItem(
                      context: context,
                      link: "assets/2.webp",
                      location: "بنغازي , درنة",
                      place: "فندق الصفوة",
                    ),
                    AdsItem(
                      link: "assets/1.webp",
                      context: context,
                      place: "فندق الودان",
                      location: 'طرابلس , الظهرة',
                    )
                  ],
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

                            return CityItem(
                              context: context,
                              link: "assets/detailsimage.jpg",
                              // location: "بلا , بلا",
                              place: name,
                              onTap: () {
                                cityController.getCityDestinations(id);
                              },
                            );
                          },
                          itemCount: controller.cityList!.city.length,
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
