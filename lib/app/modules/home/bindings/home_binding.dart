import 'package:get/get.dart';
import 'package:my_trip/app/modules/city_destinations/controllers/city_destinations_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => CityDestinationsController(), fenix: true);

  }
}
