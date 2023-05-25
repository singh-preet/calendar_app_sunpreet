import 'package:flutter/material.dart';

import 'color_utils.dart';

class StyleManager {
  StyleManager._();

  /// This is the style for the header text of the app
  static TextStyle headerTextStyle({Color? color}) {
    return TextStyle(
        color: color??AppColor.blackColor, fontSize: 24.0, fontWeight: FontWeight.w500);
  }

  ///Normal Text
  static TextStyle generalTextStyle = const TextStyle(color: Colors.black);
  ///Greyed Out Text
  static TextStyle greyedOutTextStyle =
      const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400);
}
