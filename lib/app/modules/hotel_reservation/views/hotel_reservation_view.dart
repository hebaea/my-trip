import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';

import '../controllers/hotel_reservation_controller.dart';

class HotelReservationView extends GetView<HotelReservationController> {
  const HotelReservationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DefaultText('حجز فندق'),
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
