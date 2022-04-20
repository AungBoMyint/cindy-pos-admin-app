import 'package:flutter/material.dart';

/*final appColor = HexColor("0BC81D");
final backgroundBoxDecoration = BoxDecoration(
  color: appColor,
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      HexColor("05640E"),
      HexColor("1BED30"),
      HexColor("05640"),
    ],
  ),
);*/

/*final loginBoxDecoration = BoxDecoration(
  color: HexColor("6CBEB4"),
  borderRadius: const BorderRadius.all(Radius.circular(25)),
);*/

InputDecoration inputDecoration(String hintText, IconData iconData) {
  return InputDecoration(
    border: InputBorder.none,
    hintText: hintText,
    hintStyle: const TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
    prefixIcon: Icon(iconData, color: Colors.white),
  );
}

//TEXT THEME
const header1 = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);
const header2 = TextStyle(
  color: Colors.black,
  fontSize: 16,
);
const buttonText = TextStyle(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.bold,
);

//COLOR
//final orderNowColor = HexColor("23FA00");
