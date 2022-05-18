import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';

import 'text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    this.controller,
    this.validator,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: (v) {},
        onSaved: (v) {},
        controller: controller,
        obscureText: true,
        onChanged: onChanged,
        cursorColor: AppThemeColors.primaryColor,
        decoration: const InputDecoration(
          hintText: "كلمة المرور",
          icon: Icon(
            PhosphorIcons.lock,
            color: AppThemeColors.primaryColor,
          ),
          suffixIcon: Icon(
            PhosphorIcons.eye,
            color: AppThemeColors.primaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
