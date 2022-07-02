import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/appartment_reservation_controller.dart';

class AppartmentReservationView
    extends GetView<AppartmentReservationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppartmentReservationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AppartmentReservationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
