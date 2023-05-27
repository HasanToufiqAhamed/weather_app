import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app_op/app/data/config/app_dimens.dart';
import 'package:weather_app_op/app/utils/extensions/widget.extensions.dart';

class ProbabilityTile extends StatelessWidget {
  final Widget icon;
  final String value;

  const ProbabilityTile({
    required this.icon,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: 100.circularRadius,
        color: Colors.black26,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.padding12,
        vertical: AppDimens.padding4,
      ),
      child: Row(
        children: [
          Text(value),
          AppDimens.padding6.horizontalSpacing,
          icon,
        ],
      ),
    );
  }
}
