import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color primaryYellowColor = const Color(0xffFF9727);
Color primaryOrangeColor = const Color(0xffFF6B23);
Color deepTextColor = const Color(0xff010832);
Color lightTextColor = const Color(0xff02308E);
Color secondaryBgColor = Color(0xffFFF1E9);


TextStyle Head1Text(textColor){
  return TextStyle(
    color: textColor,
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );
}

TextStyle TileHead1Text(textColor){
  return TextStyle(
    color: textColor,
    fontSize: 17,
    fontWeight: FontWeight.w500,
  );
}

TextStyle Head2Text(textColor){
  return TextStyle(
      color: textColor,
      fontSize: 14,
      fontWeight: FontWeight.w500
  );
}
TextStyle Head7Text(textColor){
  return TextStyle(
      color: textColor,
      fontSize: 13,
      fontWeight: FontWeight.w400
  );
}

TextStyle Head9Text(textColor){
  return TextStyle(
      color: textColor,
      fontSize: 9,
      fontWeight: FontWeight.w500
  );
}

void SuccessToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: lightTextColor,
      textColor: Colors.white,
      fontSize: 16.0
  );
}


void ErrorToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}