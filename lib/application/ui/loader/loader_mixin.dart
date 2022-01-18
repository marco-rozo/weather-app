import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loaderRX) {
    ever<bool>(loaderRX, (loading) async {
      if (loading) {
        await Get.dialog(
          const Center(
            child: SpinKitThreeBounce(color: Colors.white),
          ),
          barrierDismissible: false,
        );
      } else {
        Get.back();
      }
    });
  }
}
