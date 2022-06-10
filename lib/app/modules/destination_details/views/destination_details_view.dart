import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/global_widgets/rounded_button.dart';
import '../controllers/destination_details_controller.dart';

class DestinationDetailsView extends GetView<DestinationDetailsController> {
  const DestinationDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height / 2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/travel-details.jpg"),
                    // <-- BACKGROUND IMAGE
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(80),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.02, vertical: width * 0.02),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () => Get.back(),
                        child: const Icon(
                          PhosphorIcons.arrow_right,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(2),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Icon(
                          PhosphorIcons.heart_fill,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: width * 0.04),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              PhosphorIcons.map_pin,
                              size: width * 0.04,
                              color: AppThemeColors.grayPrimary300,
                            ),
                          ),
                          WidgetSpan(
                            child: DefaultText(
                              'العنوان',
                              color: AppThemeColors.grayPrimary400,
                              height: 1,
                              fontSize: width * 0.04,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: width * 0.02),
                    DefaultText(
                      'اسم المكان',
                      color: Colors.black,
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w800,
                    ),
                    SizedBox(height: width * 0.02),
                    SizedBox(height: width * 0.02),
                    Row(
                      children: [
                        SizedBox(width: width * 0.02),
                        DefaultText('التقييم',
                            height: 1,
                            color: AppThemeColors.grayPrimary400,
                            fontSize: width * 0.04),
                        SizedBox(width: width * 0.04),
                        Icon(
                          PhosphorIcons.star_fill,
                          color: AppThemeColors.primaryColor,
                          size: width * 0.04,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: width * 0.02),
                        DefaultText('تواصل ',
                            color: AppThemeColors.grayPrimary400,
                            fontSize: width * 0.04),
                        SizedBox(width: width * 0.04),
                        ElevatedButton(
                          onPressed: () {},
                          child: const DefaultText(
                            'تواصل',
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: width * 0.04),
                    DefaultText("category_id",
                        color: AppThemeColors.primaryPureBlack,
                        fontSize: width * 0.035),
                    SizedBox(height: width * 0.04),
                    DefaultText('city_id',
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.w800,
                        color: AppThemeColors.primaryPureBlack),
                    SizedBox(
                      height: width * 0.02,
                    ),
                    SizedBox(height: width * 0.04),
                    RoundedButton(text: 'إحجز', press: () {}),
                    SizedBox(height: width * 0.02),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
