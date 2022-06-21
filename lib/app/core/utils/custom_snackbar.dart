import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';

customSnackbar(title, message, type) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor:
          type == "error" ? AppThemeColors.error500 : AppThemeColors.success500,
      colorText: AppThemeColors.primaryPureWhite,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10));
}
