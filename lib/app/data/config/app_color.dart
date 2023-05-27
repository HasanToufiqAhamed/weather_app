import 'package:flutter/material.dart';

class AppColor {
  static const Color primaryColor = Color(0xffF47280);

  // final Color primaryColor = const Color(0xff68A7AD); ///final 1
  static const Color secondaryPrimaryColor = Color(0xff0dce71);

  // static const greenDark = Color(0xFF1D9A8E);
  static const Color scaffoldBackColorLight = Color(0xffF7F7F7);
  static const Color scaffoldBackColorNight = Color(0xff101010);

  static const Color textColorLight = Color(0xff131B1A);
  static const Color textColorNight = Color(0xfff3f3f3);

  static const Color subTextColorLight = Color(0xff9C9C9C);
  static const Color subTextColorNight = Color(0xff898989);

  static const Color loadingColorLight = Colors.black12;
  static const Color loadingColorDark = Colors.white24;

  containerColor({required bool dark}) {
    return dark
        ? Colors.white.withOpacity(0.1)
        : Colors.black.withOpacity(0.08);
  }

  containerColorPrimary({required bool dark}) {
    return dark
        ? Colors.grey[900]
        : Colors.white;
  }
  static const Color loadingColorLight2 = Color(0xff5b5b5b);

  Color shimmerColor({required bool dark})  {
    return dark ?  Colors.grey :  Colors.grey;
  }

  shimmerBaseColor({required bool dark})  {
    return dark ? Colors.grey[900] : Colors.blueGrey.shade50;
  }

  Color shimmerHighliterColor({required bool dark}) {
    return dark ? const Color(0xff3a3a3a) : Colors.white;
  }

  Color containerColorLight({required bool dark}) {
    return dark
        ? Colors.white.withOpacity(0.05)
        : Colors.black.withOpacity(0.02);
  }
}
