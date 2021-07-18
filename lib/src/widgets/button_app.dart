import 'package:flutter/material.dart';
import 'package:drivering/src/utils/colors.dart' as utils;

class ButtonApp extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;
  final Function onPressed;

  ButtonApp(
      {Key? key,
      required this.onPressed,
      required this.color,
      required this.text,
      this.icon = Icons.arrow_forward_ios})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: this.color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: () => {this.onPressed()},
        child: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: Container(
                alignment: Alignment.center,
                height: 50,
                child: Text(this.text)),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10),
              height: 30,
              width: 30,
              child: CircleAvatar(
                child: Icon(
                  this.icon,
                  color: utils.Colors.driveringAppColor,
                ),
                backgroundColor: Colors.white,
              ),
            ),
          )
        ]));
  }
}
