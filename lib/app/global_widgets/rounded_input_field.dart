import 'package:flutter/material.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';

import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String hintText;
  final Widget? icon;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const RoundedInputField(
      {Key? key,
      this.controller,
      required this.hintText,
      required this.icon,
      required this.onChanged,
      this.keyboardType,
      this.validator,
      this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: (v) {},
        onSaved: (v) {},
        keyboardType: keyboardType,
        controller: controller,
        onChanged: onChanged,
        cursorColor: AppThemeColors.primaryColor,
        decoration: InputDecoration(
          icon: icon,
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
