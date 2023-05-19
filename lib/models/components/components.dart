import 'package:flutter/material.dart';

Widget largeButton({
    double width = 180, required String text, required Function() onPressed,}) {
  return Container(
    width: width,
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 3, 184, 78),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    ),
  );
}

Widget smallButton({
    double width = 100, required String text, required Function() onPressed,}) {
  return Container(
    width: width,
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 3, 184, 78),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    ),
  );
}



