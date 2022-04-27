import 'package:flutter/material.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';

const String baseURL = "http://10.0.2.2:8000/api/"; //emulator localhost
const Map<String, String> headers = {"Content-Type": "application/json"};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: DefaultText(text),
    duration: const Duration(seconds: 1),
  ));
}
