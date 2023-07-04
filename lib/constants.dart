import 'package:flutter/material.dart';
import 'package:kaku/size_config.dart';

const kEndpoint = 'http://kaku.biz.id/index.php/api/';
const kEndpointGambar = 'http://kaku.biz.id/assets/img/menu/';
const kPrimaryColor = Color.fromARGB(255, 67, 111, 255);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp pesanValidatorRegExp =
    RegExp(r"http://kaku.biz.id/index.php/pesan/meja/no/+[0-9]");

const String kEmailNullError = "Masukkan email anda";
const String kInvalidEmailError = "Masukkan email anda sekali lagi";
const String kPassNullError = "Masukkan password";
const String kShortPassError = "Password terlalu pendek";
const String kMatchPassError = "Password tidak sesuai";
const String kNamelNullError = "Masukkan nama anda";
const String kPhoneNumberNullError = "Masukkan nomor telepon anda";
const String kPhoneNumberInvalid = "Nomor telepon tidak valid !";
const String kAddressNullError = "Masukkan alamat anda";
const String kUsernameInput = "Masukkan username anda";
const String kUsernameUsed = "Username tidak tersedia !";
const String kOTPInvalid = "OTP yang anda masukkan salah";
const String kLoginInvalid = "Username atau Password Salah";
final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
