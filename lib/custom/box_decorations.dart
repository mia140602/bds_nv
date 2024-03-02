import 'package:flutter/material.dart';

import '../my_theme.dart';

class BoxDecorations {
  static BoxDecoration buildBoxDecoration_1({double radius = 6.0}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.1),
          blurRadius: 10,
          spreadRadius: 0.0,
          offset: Offset(0.0, 10.0), // shadow direction: bottom right
        )
      ],
    );
  }

  static BoxDecoration buildCartCircularButtonDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(16.0),
      color: Color.fromRGBO(229, 241, 248, 1),
    );
  }

  static BoxDecoration buildCircularButtonDecoration_1() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(36.0),
      color: Colors.white.withOpacity(.80),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.08),
          blurRadius: 20,
          spreadRadius: 0.0,
          offset: Offset(0.0, 10.0), // shadow direction: bottom right
        )
      ],
    );
  }

  static BoxDecoration buildCartRectacleButtonDecoration() {
    return BoxDecoration(
        border: Border.all(color: Color(0xffececec), width: 1),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white);
  }

  static BoxDecoration buildRectacleButtonDecoration_1() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      color: MyTheme.accent_color,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.08),
          blurRadius: 20,
          spreadRadius: 0.0,
          offset: Offset(0.0, 10.0), // shadow direction: bottom right
        )
      ],
    );
  }

  static BoxDecoration buildBoxDecoration_2({double radius = 6.0}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Color(0xFFFFFFFF),
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.black.withOpacity(.1),
      //     blurRadius: 10,
      //     spreadRadius: 0.0,
      //     offset: Offset(0.0, 10.0), // shadow direction: bottom right
      //   )
      // ],
    );
  }
}
