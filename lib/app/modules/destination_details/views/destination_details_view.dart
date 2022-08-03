import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/data/model/destination_details.dart';
import 'package:my_trip/app/data/model/destination_model.dart';
import 'package:my_trip/app/data/model/user_model.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/global_widgets/rounded_button.dart';
import 'package:my_trip/app/modules/appartment_reservation/controllers/appartment_reservation_controller.dart';
import 'package:my_trip/app/modules/chalets_reservation/controllers/chalets_reservation_controller.dart';
import 'package:my_trip/app/modules/favorites/controllers/favorites_controller.dart';
import 'package:my_trip/app/modules/hotel_reservation/controllers/hotel_reservation_controller.dart';
import '../controllers/destination_details_controller.dart';

class DestinationDetailsView extends GetView<DestinationDetailsController> {
  DestinationDetailsView({Key? key}) : super(key: key);
  DestinationDetails? destinationDetails;
  Destination? destination;
  UserModel? user;
  final apartmentReservationController =
      Get.find<ApartmentReservationController>();
  final hotelReservationController = Get.find<HotelReservationController>();
  final chaletsReservationController = Get.find<ChaletsReservationController>();
  final favoriteController = Get.find<FavoritesController>();
  final storage = GetStorage();

  late var guestId = storage.read('id');

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int? destinationId = controller.destinationDetails?.destinationId;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://mytrip.justhost.ly/${controller.destinationDetails?.destinationImg}'),
                    // <-- BACKGROUND IMAGE
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(80),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02, vertical: width * 0.02),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () => Get.back(),
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(2),
                        ),
                        child: const Icon(
                          PhosphorIcons.arrow_right,
                        ),
                      ),
                      Obx(
                        () => controller.isDataLoading.value
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () {
                                  final storage = GetStorage();

                                  var guestId = storage.read('id');

                                  if (controller
                                          .destinationDetails!.isFavorite ==
                                      0) {
                                    favoriteController.makeFavorite(
                                      guestId,
                                      controller
                                          .destinationDetails?.destinationId,
                                    );
                                  } else {
                                    favoriteController.makeunFavorite(
                                        guestId,
                                        controller
                                            .destinationDetails?.destinationId);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                ),
                                child:
                                    // Obx(() => controller.isFavorite.value == 1
                                    //     ? Icon(
                                    //         PhosphorIcons.heart_fill,
                                    //         color: AppThemeColors.error500,
                                    //       )
                                    //     : Icon(
                                    //         PhosphorIcons.heart_fill,
                                    //       ))
                                    controller.isFavorite.value == 1
                                        ? Icon(
                                            PhosphorIcons.heart_fill,
                                            color: AppThemeColors.error500,
                                          )
                                        : Icon(
                                            PhosphorIcons.heart_fill,
                                          ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: width * 0.04),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              PhosphorIcons.map_pin,
                              size: width * 0.04,
                              color: AppThemeColors.grayPrimary300,
                            ),
                          ),
                          WidgetSpan(
                            child: DefaultText(
                              "${controller.destinationDetails?.destinationAddress}",
                              color: AppThemeColors.grayPrimary400,
                              height: 1,
                              fontSize: width * 0.04,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: width * 0.02),
                    DefaultText(
                      '${controller.destinationDetails?.destinationName}',
                      color: Colors.black,
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w800,
                    ),
                    SizedBox(height: width * 0.02),
                    SizedBox(height: width * 0.02),
                    Row(
                      children: [
                        SizedBox(width: width * 0.02),
                        DefaultText(
                            "${controller.destinationDetails?.destinationEvaluation}",
                            height: 1,
                            color: AppThemeColors.grayPrimary400,
                            fontSize: width * 0.04),
                        SizedBox(width: width * 0.04),
                        Icon(
                          PhosphorIcons.star_fill,
                          color: AppThemeColors.primaryColor,
                          size: width * 0.04,
                        ),
                      ],
                    ),
                    SizedBox(height: width * 0.02),
                    DefaultText('${controller.destinationDetails?.hostPhone}'),
                    SizedBox(height: width * 0.02),
                    DefaultText('${controller.destinationDetails?.hostEmail}'),
                    Row(
                      children: [
                        SizedBox(width: width * 0.02),
                        DefaultText('تقييم',
                            color: AppThemeColors.grayPrimary400,
                            fontSize: width * 0.04),
                        SizedBox(width: width * 0.04),
                        ElevatedButton(
                          onPressed: () {
                            // guestId,
                            // controller.destinationDetails!.destinationId
                            controller.rateDestination(guestId,
                                controller.destinationDetails!.destinationId);
                            // controller.doRateDestination(guestId, controller.destinationDetails!.destinationId);
                          },
                          child: const DefaultText(
                            'تقييم',
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: width * 0.04),
                    DefaultText(
                        "المدينة : ${controller.destinationDetails?.cityName}",
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.w800,
                        color: AppThemeColors.primaryPureBlack),
                    SizedBox(height: width * 0.04),
                    DefaultText(
                        "التصنيف : ${controller.destinationDetails?.categoryName}",
                        color: AppThemeColors.primaryPureBlack,
                        fontSize: width * 0.035),
                    SizedBox(
                      height: width * 0.02,
                    ),
                    SizedBox(height: width * 0.04),
                    RoundedButton(
                      text: 'إحجز',
                      press: () {
                        switch (controller.destinationDetails?.categoryId) {
                          case (1):
                            hotelReservationController.reservationShowHotel(
                                destinationId: destinationId);
                            break;
                          case (2):
                            apartmentReservationController
                                .reservationShowApartment(
                                    destinationId: destinationId);
                            break;
                          case (3):
                            chaletsReservationController.reservationShowChalet(
                                destinationId: destinationId);
                            break;
                        }
                      },
                    ),
                    SizedBox(height: width * 0.02),
                    RoundedButton(text: 'تواصل معنا', press: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
