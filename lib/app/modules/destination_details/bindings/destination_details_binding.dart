import 'package:get/get.dart';

import '../controllers/destination_details_controller.dart';

class DestinationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DestinationDetailsController>(
      () => DestinationDetailsController(),
    );
  }
}
