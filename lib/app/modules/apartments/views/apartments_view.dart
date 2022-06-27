import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/apartments_controller.dart';

class ApartmentsView extends GetView<ApartmentsController> {
  const ApartmentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'ApartmentsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
