import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/constants.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/global_widgets/rounded_button.dart';
import 'package:my_trip/app/modules/welcome/views/welcome_view.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        skipStyle: TextButton.styleFrom(primary: kPrimaryColor),
        doneStyle: TextButton.styleFrom(primary: kPrimaryColor),
        nextStyle: TextButton.styleFrom(primary: kPrimaryColor),
        pages: [
          PageViewModel(
            titleWidget: const DefaultText(
              'خطط',
            ),
            bodyWidget: const DefaultText(
              'الوصف',
            ),
            image: buildImage('assets/images/plan.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            titleWidget: const DefaultText(
              'اختر وجهنك',
            ),
            bodyWidget: const DefaultText(
              'الوصف',
            ),
            image: buildImage('assets/images/shoosedistination.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            titleWidget: const DefaultText(
              'احجز',
            ),
            bodyWidget: const DefaultText(
              'الوصف',
            ),
            image: buildImage('assets/images/book.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            titleWidget: const DefaultText(
              'اعد حقائبك',
            ),
            bodyWidget: const DefaultText(
              ' ,  هيا بنا , ابدأ الرحلة',
            ),
            footer: RoundedButton(
              text: 'ابدا رحلتك',
              press: () => Get.to(
                WelcomeView(),
              ),
            ),
            image: buildImage('assets/images/letsgo.png'),
            decoration: getPageDecoration(),
          ),
        ],
        done: const DefaultText(
          'انتهى',
          fontWeight: FontWeight.w500,
        ),
        onDone: () => Get.to(WelcomeView()),
        showSkipButton: true,
        skip: const DefaultText(
          'تخطي',
        ),
        onSkip: () => Get.to(WelcomeView()),
        next: const Icon(
          PhosphorIcons.caret_right_bold,
          color: Colors.black,
        ),
        dotsDecorator: getDotDecoration(),
        globalBackgroundColor: Colors.white,
      ),
    );
  }

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: kPrimaryLightColor,
        activeColor: kPrimaryColor,
        size: const Size(10, 10),
        activeSize: const Size(20, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 12),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
