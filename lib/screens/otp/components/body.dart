import 'package:flutter/material.dart';
import 'package:kaku/constants.dart';
import 'package:kaku/size_config.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "Verifikasi OTP",
                style: headingStyle,
              ),
              Text("Kami mengirim OTP ke Email"),
              buildTimer(),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  // OTP code resend
                },
                child: Text(
                  "Resend OTP Code",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("OTP akan kadaluarsa dalam "),
        TweenAnimationBuilder(
          tween: Tween(begin: 300.0, end: 0.0),
          duration: Duration(seconds: 300),
          builder: (_, dynamic value, child) => Text(
            "${value.toInt()} detik",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
