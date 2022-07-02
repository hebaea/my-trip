import 'package:get/get.dart';
import 'package:my_trip/app/modules/destination_details/controllers/destination_details_controller.dart';

import '../controllers/favorites_controller.dart';

class FavoritesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoritesController>(() => FavoritesController(), fenix: true);
    Get.lazyPut<DestinationDetailsController>(
        () => DestinationDetailsController(),
        fenix: true);
  }
}
