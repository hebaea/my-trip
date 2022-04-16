import 'package:flutter/material.dart';
import 'package:my_trip/app/core/theme/constants.dart';

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
          child: Text(
            login ? "تسجيل حساب جديد" : "تسجيل الدخول",
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
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
