import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/hotel_reservation_details_controller.dart';

class HotelReservationDetailsView
    extends GetView<HotelReservationDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HotelReservationDetailsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HotelReservationDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
