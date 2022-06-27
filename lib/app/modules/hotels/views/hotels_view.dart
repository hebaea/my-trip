import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/hotels_controller.dart';

class HotelsView extends GetView<HotelsController> {
  const HotelsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'HotelsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
