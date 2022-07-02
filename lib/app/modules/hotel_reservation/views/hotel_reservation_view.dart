import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/hotel_reservation_controller.dart';

class HotelReservationView extends GetView<HotelReservationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HotelReservationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HotelReservationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
