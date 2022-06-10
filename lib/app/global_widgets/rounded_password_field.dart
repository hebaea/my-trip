import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:my_trip/app/core/theme/color_theme.dart';

import 'text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final bool? Function()? onTap;
  final Widget? suffix;
  final bool obscureText;

  const RoundedPasswordField(
      {Key? key,
      required this.onChanged,
      this.controller,
      this.validator,
      this.onSaved,
      this.suffix,
      required this.obscureText,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        textInputAction: TextInputAction.done,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password (Min. 6 Character) ");
          }
        },
        onSaved: onSaved,
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        cursorColor: AppThemeColors.primaryColor,
        decoration: InputDecoration(
          hintText: "كلمة المرور",
          icon: const Icon(
            PhosphorIcons.lock,
            color: AppThemeColors.primaryColor,
          ),
          border: InputBorder.none,
          suffixIcon: InkWell(
            child: const Icon(
              PhosphorIcons.eye,
              color: AppThemeColors.primaryColor,
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
