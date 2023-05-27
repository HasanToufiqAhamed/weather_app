import 'package:flutter/material.dart';

import '../../../data/config/app_color.dart';
import '../../../data/config/app_dimens.dart';

class MainLoader extends StatelessWidget {
  const MainLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: AppDimens.primaryPadding * 3,
        width: AppDimens.primaryPadding * 3,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}
