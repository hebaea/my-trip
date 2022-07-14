import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/apartment_reservation_details_controller.dart';

class ApartmentReservationDetailsView
    extends GetView<ApartmentReservationDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ApartmentReservationDetailsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ApartmentReservationDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
