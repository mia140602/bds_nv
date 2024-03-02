import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Loadings {
  const Loadings._();
  static int loadingNumber = 0;
  static void show({Future<void> Function()? backButton}) {
    if (loadingNumber == 0) {
      showDialog(
          useSafeArea: false,
          barrierColor: Colors.transparent,
          context: Get.context!,
          builder: (context) {
            return _LoadingWidget(
              backButton: backButton,
            );
          });
    }
    loadingNumber++;
  }

  static void hide() {
    if (loadingNumber > 0) {
      loadingNumber--;
      if (loadingNumber == 0) {
        Get.back();
      }
    }
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({this.backButton});

  final Future<void> Function()? backButton;
  static double dx = 0;

  Future<bool> _onWillPop() async {
    if (backButton is Function) {
      await backButton!();
      return true;
    }
    return false;
  }

  _onHorizontalDragStart(DragStartDetails details) {
    dx = details.localPosition.dx;
  }

  _onHorizontalDragEnd(DragEndDetails details) async {
    if ((backButton is Function) &&
        (dx < 30) &&
        (details.primaryVelocity != null) &&
        (details.primaryVelocity! > 200)) {
      dx = 0;
      await backButton!();
    }
    dx = 0;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: GestureDetector(
          onHorizontalDragStart: _onHorizontalDragStart,
          onHorizontalDragEnd: _onHorizontalDragEnd,
          child: Container(
            width: Get.width,
            height: 56,
            color: Colors.black.withOpacity(0.4),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ));
  }
}
