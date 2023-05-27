import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../config.dart';
import 'package:location/location.dart';

class LocationServiceController extends SuperController {
  // final AuthRepository _authRepository;
  //
  // LocationServiceController({
  //   required AuthRepository authRepository,
  // }) : _authRepository = authRepository;

  @override
  void onDetached() {
    // positionStream?.cancel();
  }

  bool _inactiveState = false;

  @override
  void onInactive() {
    _inactiveState = true;
  }

  @override
  void onPaused() {}

  @override
  void onResumed() {
    if (_inactiveState == true) {
      _inactiveState = false;
    }
  }

  LatLng latLng = const LatLng(41.311158, 69.279737);

  @override
  onReady() {
    ///nan
    super.onReady();
  }

  ///get location coordinate
  Future<LatLng> determinePosition() async {
    try {
      bool mainPermission = await getLocationPermission();
      if (!mainPermission) {
        return ConfigEnvironments.offLocation;
      } else {
        Position p = await Geolocator.getCurrentPosition();

        return LatLng(
          p.latitude,
          p.longitude,
        );
      }
    } catch (e, t) {
      debugPrint('get location error ---<>');
      debugPrint(e.toString());
      debugPrint(t.toString());
      return ConfigEnvironments.offLocation;
    }
  }

  bool appOpenAndEnable = false;
  bool initialRequest = false;

  ///get location permission status
  Future<bool> getLocationPermission() async {
    Location location = Location();
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return false;
      } else {
        appOpenAndEnable = true;
      }
    }

    PermissionStatus permissionStatus = await location.hasPermission();

    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus == PermissionStatus.denied) {
        return false;
      } else if (permissionStatus == PermissionStatus.deniedForever) {
        await _openAppSettings();
        return false;
      }
    } else if (permissionStatus == PermissionStatus.deniedForever) {
      await _openAppSettings();
    }

    return true;
  }

  /// open app settings
  Future _openAppSettings() async {
    Fluttertoast.showToast(msg: 'You need to allow location permission for this feature');
    await Geolocator.openAppSettings();
  }
}
