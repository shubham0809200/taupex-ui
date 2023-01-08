import 'package:flutter/material.dart';

Widget signupButton(BuildContext context, String text, IconData icon,
    Function() onPressed, Color color, Color textColor) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      // width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.065,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListTile(
        leading: Icon(icon, color: textColor, size: 30),
        title: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: textColor, fontSize: 15, fontWeight: FontWeight.w600),
        ),
        onTap: onPressed,
      ));
}
