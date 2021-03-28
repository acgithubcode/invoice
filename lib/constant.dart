import 'package:flutter/material.dart';

class ScreenConfig {
  static double deviceWidth;
  static double deviceHeight;
  static double designHeight = 1300;
  static double designWidth = 600;
  static init(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
  }

  // Designer user 1300 device height,
  // so I have to normalize to the device height
  static double getProportionalHeight(height) {
    return (height / designHeight) * deviceHeight;
  }

  static double getProportionalWidth(width) {
    return (width / designWidth) * deviceWidth;
  }
}

// Colors
const iPrimarryColor = Color(0xFFF9FCFF);
const iAccentColor = Color(0xFFFFB44B);
const iAccentColor2 = Color(0xFFFFEAC9);

const demoData = [
  {
    "imagePath": "assets/images/image-1.png",
    "price": 25000,
    "quantity": 1,
    "itemDesc": "bronzr package"
  },
  {
    "imagePath": "assets/images/image-3.png",
    "price": 45000,
    "quantity": 1,
    "itemDesc": "Sliver Package"
  },
  {
    "imagePath": "assets/images/image-2.png",
    "price": 75000,
    "quantity": 1,
    "itemDesc": "Gold Package"
  }
];
