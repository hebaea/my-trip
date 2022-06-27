import 'package:get/get.dart';
import 'package:my_trip/app/modules/destination_details/controllers/destination_details_controller.dart';

import '../controllers/destinations_controller.dart';

class DestinationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DestinationsController>(
      () => DestinationsController(),
    );
    Get.lazyPut(() => DestinationDetailsController(), fenix: true);
  }
}
