import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import 'widgets/onboarding.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Onboarding();
    // return SafeArea(
    //   child: IntroductionScreen(
    //     rtl: true,
    //     skipStyle: TextButton.styleFrom(primary: AppThemeColors.primaryColor),
    //     doneStyle: TextButton.styleFrom(primary: AppThemeColors.primaryColor),
    //     nextStyle: TextButton.styleFrom(primary: AppThemeColors.primaryColor),
    //     pages: [
    //       PageViewModel(
    //         titleWidget: const DefaultText('خطط',
    //             fontSize: 20, fontWeight: FontWeight.bold),
    //         bodyWidget: const DefaultText('الوصف', fontSize: 12),
    //         image: buildImage('assets/images/plan.png'),
    //         decoration: getPageDecoration(),
    //       ),
    //       PageViewModel(
    //         titleWidget: const DefaultText('اختر وجهنك',
    //             fontSize: 20, fontWeight: FontWeight.bold),
    //         bodyWidget: const DefaultText('الوصف', fontSize: 12),
    //         image: buildImage('assets/images/shoosedistination.png'),
    //         decoration: getPageDecoration(),
    //       ),
    //       PageViewModel(
    //         titleWidget: const DefaultText('احجز',
    //             fontSize: 20, fontWeight: FontWeight.bold),
    //         bodyWidget: const DefaultText('الوصف', fontSize: 12),
    //         image: buildImage('assets/images/book.png'),
    //         decoration: getPageDecoration(),
    //       ),
    //       PageViewModel(
    //         titleWidget: const DefaultText('اعد حقائبك',
    //             fontSize: 20, fontWeight: FontWeight.bold),
    //         bodyWidget:
    //             const DefaultText(' ,  هيا بنا , ابدأ الرحلة', fontSize: 12),
    //         footer: Padding(
    //           padding: EdgeInsets.symmetric(horizontal: 10.w),
    //           child: RoundedButton(
    //             text: 'ابدا رحلتك',
    //             press: () => Get.to(
    //               () => const WelcomeView(),
    //             ),
    //           ),
    //         ),
    //         image: buildImage('assets/images/letsgo.png'),
    //         decoration: getPageDecoration(),
    //       ),
    //     ],
    //     done: const DefaultText(
    //       'انتهى',
    //       fontWeight: FontWeight.w500,
    //     ),
    //     onDone: () => Get.toNamed(Routes.WELCOME),
    //     showSkipButton: true,
    //     skip: const DefaultText(
    //       'تخطي',
    //     ),
    //     onSkip: () => Get.toNamed(Routes.WELCOME),
    //     next: const Icon(
    //       PhosphorIcons.caret_right_bold,
    //       color: Colors.black,
    //     ),
    //     dotsDecorator: getDotDecoration(),
    //     globalBackgroundColor: Colors.white,
    //   ),
    // );
  }

// Widget buildImage(String path) =>
//     Center(child: Image.asset(path, width: 700.w));
//
// DotsDecorator getDotDecoration() => DotsDecorator(
//       color: AppThemeColors.primaryLightColor,
//       activeColor: AppThemeColors.primaryColor,
//       size: const Size(10, 10),
//       activeSize: const Size(18, 10),
//       activeShape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(24.r),
//       ),
//     );
//
// PageDecoration getPageDecoration() => const PageDecoration(
//       imagePadding: EdgeInsets.only(top: 100),
//     );
}
