import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension WidgetExtension on num {
  Widget get horizontalSpacing => SizedBox(width: toDouble());

  Widget get verticalSpacing => SizedBox(height: toDouble());

  BorderRadius get circularRadius => BorderRadius.circular(toDouble());
}

extension DateExtensionDatabase on DateTime {
  String get hourlyDateFormat => DateFormat('hh a').format(
        this,
      );

  String get hh_mm_a => DateFormat('hh a').format(
        this,
      );

  String get dailyDateFormat => DateFormat('d MMM').format(
        this,
      );

  String get dayNameDateFormat => DateFormat('EE').format(
        this,
      );
}

extension TextExtension on String {
  String get nonZeroText => _makeNumber(this);

  String get tempUnit => this == 'M' ? 'C' : 'F';
}

String _makeNumber(String number) {
  String value = double.parse(number).toStringAsFixed(1).toString();
  if (value.contains('.')) {
    List<String> a = value.split('.');

    if (a[1] == '00' || a[1] == '0') {
      return a[0];
    }
  }

  return value;
}
