import 'package:get/get.dart';

import '../controllers/chat_details_page_controller.dart';

class ChatDetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatDetailsPageController>(
      () => ChatDetailsPageController(),
    );
  }
}
