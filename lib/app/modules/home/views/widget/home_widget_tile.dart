import 'package:flutter/material.dart';
import 'package:weather_app_op/app/data/config/app_dimens.dart';
import 'package:weather_app_op/app/utils/extensions/widget.extensions.dart';

class HomeWidget extends StatelessWidget {
  final Widget child;
  final String title;
  final bool bottomPadding;
  final bool expanded;

  const HomeWidget({
    required this.title,
    required this.child,
    this.bottomPadding = true,
    this.expanded = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppDimens.primaryRadius.circularRadius,
        color: Colors.black26,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: AppDimens.primaryPadding,
              top: AppDimens.primaryPadding,
            ),
            child: Text(
              title.toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ),
          AppDimens.primaryPadding.verticalSpacing,
          if(expanded)
          Expanded(child: child),
          if(!expanded)
          child,
          if (bottomPadding) AppDimens.primaryPadding.verticalSpacing,
        ],
      ),
    );
  }
}
