import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chalets_reservation_controller.dart';

class ChaletsReservationView extends GetView<ChaletsReservationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChaletsReservationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ChaletsReservationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
