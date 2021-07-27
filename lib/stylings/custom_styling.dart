import 'package:flutter/material.dart';

Color whiteColor = Color(0xffFFFFFF);
Color blackColor = Color(0xff000000);
Color lightGreyColor = Color(0xffF0F0F0);
Color darkGreyColor = Color(0xffAAAAAA);
Color lightRedColor = Color(0xffac3030);

TextStyle subTitleStyle = TextStyle(
    fontFamily: "NotoSansJP",
    fontSize: 18.0,
    fontWeight: FontWeight.w800,
    color: lightRedColor);

TextStyle titleStyle = TextStyle(
    fontFamily: "NotoSansJP",
    fontSize: 18.0,
    fontWeight: FontWeight.w800,
    color: blackColor);

TextStyle header1TextStyle = TextStyle(
    fontFamily: "MPLUSRounded1c",
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: blackColor);

TextStyle header2TextStyle = TextStyle(
    fontFamily: "MPLUSRounded1c",
    fontSize: 14.0,
    fontWeight: FontWeight.w200,
    color: blackColor);

TextStyle regulerTextMobileStyle =
    TextStyle(fontFamily: "MPLUSRounded1c", fontSize: 12.0, color: blackColor);

TextStyle regulerTextWebStyle =
    TextStyle(fontFamily: "MPLUSRounded1c", fontSize: 16.0, color: blackColor);

overflowText(text, textStyle) {
  return Flexible(
    child: new Container(
      child: new Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: textStyle,
      ),
    ),
  );
}