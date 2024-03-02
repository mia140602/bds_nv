import 'package:flutter/material.dart';

import '../my_theme.dart';

class InputDecorations {
  static InputDecoration buildInputDecoration_1({hint_text = ""}) {
    return InputDecoration(
        hintText: hint_text,
        filled: true,
        fillColor: MyTheme.white,
        hintStyle: TextStyle(fontSize: 12.0, color: MyTheme.textfield_grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyTheme.noColor, width: 0.2),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyTheme.accent_color, width: 0.5),
          borderRadius: const BorderRadius.all(
            const Radius.circular(6.0),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0));
  }

  static InputDecoration buildInputDecoration_phone({hint_text = ""}) {
    return InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          // borderSide: BorderSide(color: MyTheme.accent_color, width: 0.5),
        ),
        fillColor: Color(0x33C4C4C4),
        hintText: hint_text,
        filled: true,
        hintStyle: TextStyle(fontSize: 12.0, color: Color(0x80000000)),
        // enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: MyTheme.textfield_grey, width: 0.5),
        //   borderRadius: BorderRadius.only(
        //       topRight: Radius.circular(6.0),
        //       bottomRight: Radius.circular(6.0)),
        // ),
        // focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(color: MyTheme.accent_color, width: 0.5),
        //     borderRadius: BorderRadius.only(
        //         topRight: Radius.circular(6.0),
        //         bottomRight: Radius.circular(6.0))),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0));
  }

  static InputDecoration buildInputDecoration2(
      {hint_text = "", IconData? iconData}) {
    return InputDecoration(
        suffixIcon: iconData != null ? Icon(iconData) : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red)),
        hintText: hint_text,
        filled: true,
        fillColor: MyTheme.white,
        hintStyle: TextStyle(fontSize: 12.0, color: Color(0x80000000)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyTheme.dark_grey, width: 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.red, width: 0.5),
        //   borderRadius: BorderRadius.circular(15),
        // ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0));
  }

  static InputDecoration buildInputDecorationNew(
      {hint_text = "", IconData? iconData}) {
    return InputDecoration(
        suffixIcon: iconData != null ? Icon(iconData) : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.red)),
        hintText: hint_text,
        filled: true,
        fillColor: MyTheme.white,
        hintStyle: TextStyle(fontSize: 12.0, color: Color(0x80000000)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyTheme.dark_grey, width: 0.5),
          borderRadius: BorderRadius.circular(5),
        ),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.red, width: 0.5),
        //   borderRadius: BorderRadius.circular(15),
        // ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0));
  }

  static InputDecoration buildInputDecorationWithAuth(
      {hint_text = "", IconData? iconData}) {
    return InputDecoration(
        suffixIcon: iconData != null ? Icon(iconData) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          // borderSide: BorderSide(color: MyTheme.accent_color, width: 0.5),
        ),
        hintText: hint_text,
        filled: true,
        fillColor: Color(0x33C4C4C4),
        hintStyle: TextStyle(fontSize: 12.0, color: Color(0x80000000)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyTheme.noColor, width: 0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyTheme.accent_color, width: 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0));
  }

  static InputDecoration buildInputAddress({hint_text = ""}) {
    return InputDecoration(
      hintText: hint_text,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: MyTheme.accent_color, width: 0.5),
        borderRadius: const BorderRadius.all(
          const Radius.circular(25.0),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MyTheme.borderColor, width: 0.2),
        borderRadius: const BorderRadius.all(
          const Radius.circular(25.0),
        ),
      ),
      filled: true,
      fillColor: MyTheme.white,
      hintStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      suffixIcon: Image.asset(
        "assets/right_back.png",
        height: 20,
        width: 20,
      ),
    );
  }
}
