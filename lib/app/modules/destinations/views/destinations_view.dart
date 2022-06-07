import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';
import 'package:my_trip/app/modules/destinations/widgets/distinations.dart';
import '../controllers/destinations_controller.dart';

class DestinationsView extends GetView<DestinationsController> {
  const DestinationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: DefaultTabController(
          length: 4,
          child: Column(
            children: const [
              TabBar(
                indicatorColor: AppThemeColors.primaryColor,
                labelColor: AppThemeColors.primaryColor,
                unselectedLabelColor: AppThemeColors.grayPrimary400,
                tabs: [
                  Tab(
                    child: DefaultText('الكل', fontSize: 14),
                  ),
                  Tab(
                    child: DefaultText('فنادق', fontSize: 14),
                  ),
                  Tab(
                    child: DefaultText('شقق', fontSize: 14),
                  ),
                  Tab(
                    child: DefaultText('منتجعات', fontSize: 14),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Distinations(),
                    Distinations(),
                    Distinations(),
                    Distinations(),
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
