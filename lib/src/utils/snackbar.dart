import 'package:flutter/material.dart';
import 'package:drivering/src/utils/colors.dart' as Util;

class Snackbar {
  static void showSnackbar(BuildContext context, String text) {
    FocusScope.of(context).requestFocus(new FocusNode());
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
      backgroundColor: Util.Colors.driveringAppColor,
    ));
  }
}
