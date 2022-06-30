import 'package:get/get.dart';
import 'package:my_trip/app/modules/apartments/controllers/apartments_controller.dart';
import 'package:my_trip/app/modules/city_destinations/controllers/city_destinations_controller.dart';
import 'package:my_trip/app/modules/destination_details/controllers/destination_details_controller.dart';
import 'package:my_trip/app/modules/destinations/controllers/destinations_controller.dart';
import 'package:my_trip/app/modules/favorites/controllers/favorites_controller.dart';
import 'package:my_trip/app/modules/hotels/controllers/hotels_controller.dart';

import 'package:my_trip/app/modules/profile/controllers/profile_controller.dart';

import 'package:my_trip/app/modules/home/controllers/home_controller.dart';
import 'package:my_trip/app/modules/resorts/controllers/resorts_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => CityDestinationsController(), fenix: true);
    Get.lazyPut(() => DestinationsController(), fenix: true);
    Get.lazyPut(() => ResortsController(), fenix: true);
    Get.lazyPut(() => ApartmentsController(), fenix: true);
    Get.lazyPut(() => HotelsController(), fenix: true);
    Get.lazyPut(() => FavoritesController(), fenix: true);
    Get.lazyPut<DestinationDetailsController>(
            () => DestinationDetailsController(),
        fenix: true);
  }
}
