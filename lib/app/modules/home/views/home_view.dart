import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 40, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      DefaultText(
                        "Discover",
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      DefaultText(
                        "New Destination",
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        height: 1,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 22, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: SizedBox(
                          width: 260,
                          height: 44,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              focusColor: AppThemeColors.primaryColor,
                              fillColor: Colors.white54,
                              hoverColor: AppThemeColors.primaryColor,
                              prefixIcon: const Icon(
                                PhosphorIcons.magnifying_glass,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              labelText: 'Search Places',
                            ),
                          ),
                          // RoundedInputField(
                          //   onChanged: (String value) {},
                          //   hintText: 'Search Places',
                          //   icon: Icon(PhosphorIcons.magnifying_glass),
                          // ),
                        ),
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppThemeColors.primaryColor),
                        child: const Icon(
                          PhosphorIcons.funnel_simple,
                          size: 32.0,
                          color: AppThemeColors.primaryPureWhite,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      DefaultText(
                        "Popular Destinations",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      DefaultText(
                        "All",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppThemeColors.grayPrimary300,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      addsItem(context, "assets/1.webp", "alwedan hotel",
                          'tripoli , aldahra'),
                      addsItem(context, "assets/2.webp", "alsafwa hotel",
                          'benghazi , bla bla'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children: const [
                      DefaultText(
                        "Where are you going?",
                        // "Cities",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      // DefaultText(
                      //   "Where are you going?",
                      //   fontSize: 20,
                      //   fontWeight: FontWeight.bold,
                      //   color: Colors.black45,
                      // )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: SizedBox(
                    height: 230,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        cityItem(context, "assets/detailsimage.jpg", "Tripoli",
                            'bla , bla'),
                        cityItem(context, "assets/tallimage2.jpg", "Benghazi",
                            'bla bla'),
                        cityItem(context, "assets/detailsimage.jpg", "Misurata",
                            'bla , bla'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget cityItem(
    BuildContext context, String link, String place, String location) {
  return GestureDetector(
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.only(left: 12),
      child: SizedBox(
        width: 150,
        height: 210,
        child: Stack(
          children: [
            Container(
              width: 150,
              height: 210,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage((link)), fit: BoxFit.cover)),
            ),
            Container(
              width: 150,
              height: 210,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0),
                  ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 5),
                    child: DefaultText(
                      place,
                      height: 1,
                      color: AppThemeColors.primaryPureWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 20),
                    child: DefaultText(
                      location,
                      height: 1,
                      color: AppThemeColors.primaryPureWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget addsItem(
    BuildContext context, String link, String place, String location) {
  return GestureDetector(
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.only(left: 12),
      child: SizedBox(
        width: 350.w,
        height: 130.h,
        child: Stack(
          children: [
            Container(
              width: 350.w,
              height: 130.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage((link)), fit: BoxFit.cover)),
            ),
            Container(
              width: 350.w,
              height: 130.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0),
                  ], end: Alignment.centerRight, begin: Alignment.centerLeft)),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 5),
                      child: DefaultText(
                        place,
                        height: 1,
                        color: AppThemeColors.primaryPureWhite,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 20),
                      child: DefaultText(
                        location,
                        height: 1,
                        color: AppThemeColors.primaryPureWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
// Padding(
//   padding: const EdgeInsets.only(left: 12, right: 12, top: 25),
//   child: TabBar(
//     indicatorColor: Colors.transparent,
//     isScrollable: true,
//     automaticIndicatorColorAdjustment: true,
//     tabs: [
//       Text(
//         "All",
//         style: TextStyle(fontSize: 20, color: Colors.black54),
//       ),
//       Text(
//         "Beach",
//         style: TextStyle(
//             fontSize: 20, color: AppThemeColors.primaryColor),
//       ),
//       Text(
//         "Mountin",
//         style: TextStyle(fontSize: 20, color: Colors.black54),
//       ),
//       Text(
//         "Temple",
//         style: TextStyle(fontSize: 20, color: Colors.black54),
//       ),
//       Text(
//         "city",
//         style: TextStyle(fontSize: 20, color: Colors.black54),
//       ),
//     ],
//   ),
// ),
