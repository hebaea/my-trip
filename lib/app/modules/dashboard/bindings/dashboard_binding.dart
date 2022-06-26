import 'package:get/get.dart';
import 'package:my_trip/app/modules/city_destinations/controllers/city_destinations_controller.dart';

import 'package:my_trip/app/modules/profile/controllers/profile_controller.dart';

import 'package:my_trip/app/modules/home/controllers/home_controller.dart';


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


  }
}
