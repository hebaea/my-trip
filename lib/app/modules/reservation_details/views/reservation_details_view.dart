import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reservation_details_controller.dart';

class ReservationDetailsView extends GetView<ReservationDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReservationDetailsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ReservationDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
