import 'package:flutter/material.dart';
import 'package:weather_app_op/app/utils/extensions/widget.extensions.dart';

import '../../../../../domain/core/model/details_ui_model.dart';
import '../../../../data/config/app_dimens.dart';

class DetailsTime extends StatelessWidget {
  final DetailsUiModel details;

  const DetailsTime({
    Key? key,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          details.title,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        AppDimens.padding4.verticalSpacing,
        Text(
          details.value,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
