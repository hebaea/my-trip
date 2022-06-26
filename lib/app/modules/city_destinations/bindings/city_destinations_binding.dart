import 'package:get/get.dart';

import '../controllers/city_destinations_controller.dart';

class CityDestinationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CityDestinationsController(), fenix: true);
  }
}
