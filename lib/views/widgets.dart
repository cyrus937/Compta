import 'package:flutter/material.dart';

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      /*prefixIcon: hintText == "email"
          ? Icon(
              Icons.mail,
              color: Colors.white,
            )
          : Icon(
              Icons.person_pin,
              color: Colors.white,
            ),
      hintStyle: TextStyle(
        color: Colors.orangeAccent,
      ),*/
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none));
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 16);
}

TextStyle simpleTextStyles() {
  return TextStyle(color: Colors.orangeAccent, fontSize: 17);
}
