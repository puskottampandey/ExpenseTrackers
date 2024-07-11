import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kPrimaryDarkColor = Color(0xff0D0E0F);
const kseconadaryDarkColor = Color(0xff161719);
const klightDarkColor = Color(0xff464A4D);
const kverylightDarkColor = Color(0xff7A7E80);

const kPrimarylightColor = Color(0xff91919F);
const kseconadarylightColor = Color(0xffE3E5E5);
const kwhitelightColor = Color(0xffF1F1FA);
const kverywhitelightColor = Color(0xffFCFCFC);
const kvverylightColor = Color(0xffFFFFFF);

const kPrimaryVoiletColor = Color(0xff7F3DFF);
const kseconadaryVioletColor = Color(0xff8F57FF);
const klightVioletColor = Color(0xffB18AFF);
const kverylighViloetColor = Color(0xffD3BDFF);
const kvveryViloetlightColor = Color(0xffEEE5FF);

const kPrimaryRedColor = Color(0xffFD3C4A);
const kseconadaryRedColor = Color(0xffFD5662);
const klightRedColor = Color(0xffFD6F7A);
const kverylightRedColor = Color(0xffFDA2A9);
const kvveryRedlightColor = Color(0xffFDD5D7);

const kPrimaryGreenColor = Color(0xff00A86B);
const kseconadaryGreenColor = Color(0xff2AB784);
const klightGreenColor = Color(0xff65D1AA);
const kveryGreenlightColor = Color(0xff93EACA);
const kvveryGreenlightColor = Color(0xffCFFAEA);

const kPrimaryYellowColor = Color(0xffFCAC12);
const kseconadarYellowColor = Color(0xffFCBB3C);
const klightYellowColor = Color(0xffFCCC6F);
const kverylightYellowColor = Color(0xffFCDDA1);
const kvveryYellowlightColor = Color(0xffFCEED4);

const kPrimaryBlueColor = Color(0xff0077FF);
const kseconadaryBlueColor = Color(0xff248AFF);
const klightBlueColor = Color(0xff8AC0FF);
const kverylightBlueColor = Color(0xff8AC0FF);
const kvvlightBlueColor = Color(0xffBDDCFF);
const backgroundColor = Color(0xffE5E5E5);
const containergradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffF8EDD8),
      Color(0xffFCF3E1),
      Color(0xffFFF6E5),
    ]);
double titleX = 60.sp;
double title1 = 28.sp;
double title2 = 20.sp;
double title3 = 14.sp;
double regular2 = 12.sp;
double regular3 = 10.sp;
double small13 = 9.sp;
double tiny = 8.sp;

TextTheme textTheme = const TextTheme(
  headlineLarge: TextStyle(
    fontFamily: "poppins",
    fontWeight: FontWeight.bold,
    fontSize: 64,
    color: kseconadaryDarkColor,
  ),
  headlineSmall: TextStyle(
    fontSize: 13,
    fontFamily: "poppins",
  ),
  titleLarge: TextStyle(
    fontFamily: "poppins",
    fontSize: 32,
    fontWeight: FontWeight.bold,
  ),
  titleMedium: TextStyle(
    fontSize: 24,
    fontFamily: "poppins",
  ),
  titleSmall: TextStyle(
    fontFamily: "poppins",
    fontSize: 18,
  ),
  bodyLarge: TextStyle(
    fontFamily: "poppins",
    fontSize: 16,
  ),
  bodyMedium: TextStyle(
    fontFamily: "poppins",
    fontSize: 14,
  ),
  bodySmall: TextStyle(
    fontFamily: "poppins",
    fontSize: 12,
  ),
);

class ImportantKey {
  static const khaltiKey = "test_public_key_d9eab2e2d2ed4d98b313c37145938853";
  static const clientId =
      "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R";
  static const secretKey = "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==";
  static RegExp passwordCheck =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%&*~]).{8,}$');
  static RegExp emailCheck = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
}
