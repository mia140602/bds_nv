// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class MyTheme {
  static Color app_accent_color_extra_light =
      Color.fromRGBO(233, 233, 240, 1.0);
  /*configurable colors stars*/
  static Color borderColor = Color.fromARGB(226, 63, 63, 61);
  static Color black = Colors.black;
  static Color background = Color(0xffecf0f5);
  static Color accent_color = Color(0xff00a65a);
  static Color accent_color_shadow =
      Color.fromRGBO(229, 65, 28, .40); // this color is a dropshadow of
  static Color soft_accent_color = Color.fromRGBO(254, 234, 209, 1);
  static Color splash_screen_color =
      Colors.white; // if not sure , use the same color as accent color
  static Color warning_button = Colors.redAccent;
  static Color cart_item = Color(0xffF3F3F3);
  /*configurable colors ends*/
  /*If you are not a developer, do not change the bottom colors*/
  static Color white = Color.fromRGBO(255, 255, 255, 1);
  static Color noColor = Color.fromRGBO(255, 255, 255, 0);
  static Color light_grey = Color.fromRGBO(239, 239, 239, 1);
  static Color dark_grey = Color.fromRGBO(107, 115, 119, 1);
  static Color medium_grey = Color.fromRGBO(167, 175, 179, 1);
  static Color blue_grey = Color.fromRGBO(168, 175, 179, 1);
  static Color medium_grey_50 = Color.fromRGBO(167, 175, 179, .5);
  static Color grey_153 = Color.fromRGBO(153, 153, 153, 1);
  static Color dark_font_grey = Color.fromRGBO(62, 68, 71, 1);
  static Color font_grey = Color.fromRGBO(107, 115, 119, 1);
  static Color textfield_grey = Color.fromARGB(255, 73, 66, 66);
  static Color golden = Color.fromRGBO(255, 168, 0, 1);
  static Color amber = Color.fromRGBO(254, 234, 209, 1);
  static Color amber_medium = Color.fromRGBO(254, 240, 215, 1);
  static Color golden_shadow = Color.fromRGBO(255, 168, 0, .4);
  static Color green = Colors.green;
  static Color? green_light = Colors.green[200];
  static Color shimmer_base = Colors.grey.shade50;
  static Color shimmer_highlighted = Colors.grey.shade200;

  static Color btn_checkout = Colors.blue;
  static Color accent_color_light = Color(0xffBBD409);

  //testing shimmer
  /*static Color shimmer_base = Colors.redAccent;
  static Color shimmer_highlighted = Colors.yellow;*/
}
