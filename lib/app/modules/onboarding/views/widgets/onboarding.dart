import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/modules/onboarding/controllers/onboarding_controller.dart';

class Onboarding extends StatelessWidget {
  final _controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.selectedPageIndex,
              itemCount: _controller.onboardingPages.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                          _controller.onboardingPages[index].imageAsset),
                      SizedBox(
                        height: 32.h,
                      ),
                      DefaultText(
                        _controller.onboardingPages[index].title,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 64.0),
                        child: DefaultText(
                          _controller.onboardingPages[index].description,
                          fontSize: 18,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                );
              }),
          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              children: List.generate(
                  _controller.onboardingPages.length,
                  (index) => Obx(
                        () => Container(
                          margin: EdgeInsets.all(4),
                          width: 12.h,
                          height: 12.h,
                          decoration: BoxDecoration(
                              color:
                                  _controller.selectedPageIndex.value == index
                                      ? AppThemeColors.primaryColor
                                      : AppThemeColors.primaryLightColor,
                              shape: BoxShape.circle),
                        ),
                      )),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              backgroundColor: AppThemeColors.primaryColor,
              elevation: 0,
              child: Obx(
                () => DefaultText(
                  _controller.isLastPage ? "إبدأ" : "التالي",
                  color: AppThemeColors.primaryPureWhite,
                ),
              ),
              onPressed: _controller.forwardAction,
            ),
          ),
        ],
      ),
    ));
  }
}
