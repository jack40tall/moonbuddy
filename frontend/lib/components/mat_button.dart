import 'package:flutter/material.dart';

class MatButton extends StatelessWidget {
  MatButton(
      {this.title,
      this.colour,
      this.textColor = Colors.white,
      this.iconPath,
      @required this.onPressed});

  final Color colour;
  final Color textColor;
  final String title;
  final String iconPath;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Material(
        elevation: 2.0,
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
            onPressed: onPressed,
            minWidth: 200.0,
            height: 76.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconPath == null
                    ? Container()
                    : Image.asset(iconPath, width: 30),
                SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .6,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
