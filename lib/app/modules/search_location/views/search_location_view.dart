import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:weather_app_op/app/data/config/app_dimens.dart';
import 'package:weather_app_op/app/utils/extensions/widget.extensions.dart';

class SearchLocationView extends StatelessWidget {
  SearchLocationView({Key? key}) : super(key: key);

  FocusNode latFocus = FocusNode();
  FocusNode lonFocus = FocusNode();

  TextEditingController latController = TextEditingController();
  TextEditingController lonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _submit();
        },
        child: const Icon(
          Icons.check_rounded,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          AppDimens.primaryPadding,
        ),
        child: Column(
          children: [
            TextFormField(
              controller: latController,
              decoration: const InputDecoration(hintText: 'Latitude'),
              focusNode: latFocus,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onFieldSubmitted: (v) {
                lonFocus.requestFocus();
              },
            ),
            AppDimens.primaryPadding.verticalSpacing,
            TextFormField(
              controller: lonController,
              decoration: const InputDecoration(hintText: 'Longitude'),
              focusNode: lonFocus,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onFieldSubmitted: (v) {
                _submit();
              },
            ),
            (AppDimens.primaryPadding * 3).verticalSpacing,
            Text(
              'Sorry for manual searching.\nDid not able to implement google map\nsearching for unavailable apiKey.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (validate()) {
      String lat = latController.text;
      String lon = lonController.text;

      Get.back(result: {
        'lat': lat,
        'lon': lon,
      });
    }
  }

  bool validate() {
    String lat = latController.text;
    String lon = lonController.text;
    if (lat.isEmpty) {
      Fluttertoast.showToast(msg: 'Enter Latitude');
      return false;
    } else if (lon.isEmpty) {
      Fluttertoast.showToast(msg: 'Enter Longitude');
      return false;
    }
    return true;
  }
}
