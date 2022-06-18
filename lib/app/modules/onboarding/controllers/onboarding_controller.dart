import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/data/model/onboarding_info.dart';
import 'package:my_trip/app/routes/app_pages.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;

  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.toNamed(Routes.WELCOME);
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo("assets/images/plan.png", "خطط", "الوصف"),
    OnboardingInfo(
        "assets/images/shoosedistination.png", "اختر وجهنك", "الوصف"),
    OnboardingInfo("assets/images/book.png", "احجز", "الوصف"),
    OnboardingInfo("assets/images/letsgo.png", "اعد حقائبك", "الوصف"),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
