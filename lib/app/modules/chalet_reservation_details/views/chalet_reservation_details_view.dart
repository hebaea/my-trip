import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chalet_reservation_details_controller.dart';

class ChaletReservationDetailsView
    extends GetView<ChaletReservationDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChaletReservationDetailsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChaletReservationDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
