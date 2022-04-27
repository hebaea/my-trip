import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultText('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: DefaultText(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
