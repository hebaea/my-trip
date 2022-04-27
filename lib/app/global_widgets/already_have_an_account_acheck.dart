import 'package:flutter/material.dart';
import 'package:my_trip/app/core/theme/constants.dart';
import 'package:my_trip/app/global_widgets/default_text.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final void Function()? press;

  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: press,
          child: DefaultText(
            login ? "تسجيل حساب جديد" : "تسجيل الدخول",

              color: kPrimaryColor,
              fontWeight: FontWeight.bold,

          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          login ? "هل انت مستخدم جديد ؟" : "هل لديك حساب من قبل ؟",
        ),
      ],
    );
  }
}
