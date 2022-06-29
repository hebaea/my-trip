import 'package:get/get.dart';

import '../controllers/resorts_controller.dart';

class ResortsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResortsController>(
            () => ResortsController(), fenix: true
    );
  }
}
