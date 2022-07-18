import 'package:flutter/material.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';

import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String hintText;
  final bool readOnly;
  final Widget? icon;
  final TextInputAction? textInputAction;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextStyle? style;

  RoundedInputField({
    Key? key,
    this.controller,
    required this.hintText,
    required this.readOnly,
    required this.icon,
    required this.onChanged,
    this.keyboardType,
    this.validator,
    this.onSaved,
    this.textInputAction,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: AppThemeColors.primaryLightColor,
      child: TextFormField(
        style: style,
        readOnly: readOnly,
        validator: validator,
        onSaved: onSaved,
        keyboardType: keyboardType,
        controller: controller,
        onChanged: onChanged,
        textInputAction: TextInputAction.next,
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
