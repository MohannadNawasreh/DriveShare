import 'package:drive_share/models/trip.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget largeButton({
  double width = 180,
  required String text,
  required Function() onPressed,
}) {
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
  double width = 100,
  required String text,
  required Function() onPressed,
}) {
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

List<Trip> listTrip = [
  Trip(
    carOwnerName: "Eyass",
    seatNumber: 4,
    startPoint: "Al Jabber",
    endPoint: "Boulevard",
    description: "",
    tripTime: DateTime.now(),
    priceTrip: 'Free',
  ),
  Trip(
      carOwnerName: "Mohammad",
      seatNumber: 3,
      startPoint: "Zarqa",
      endPoint: "Just",
      description: "Any Pinot",
      tripTime: DateTime.now(),
      priceTrip: '1.50'),
  Trip(
    carOwnerName: "Ahmed",
    seatNumber: 4,
    startPoint: "Amman",
    endPoint: "Irbid",
    description: "Any Pinot",
    tripTime: DateTime.now(),
    priceTrip: '1.00',
  ),
  Trip(
    carOwnerName: "Eyass",
    seatNumber: 4,
    startPoint: "Al Jabber",
    endPoint: "Boulevard",
    description: "Any Pinot",
    tripTime: DateTime.now(),
    priceTrip: '1.00',
  ),
  Trip(
      carOwnerName: "Mohammad",
      seatNumber: 3,
      startPoint: "Zarqa",
      endPoint: "Just",
      description: "Any Pinot dfhb hjbdsbfjb , khsduifd ,sdkhf ,sdjgjf",
      tripTime: DateTime.now(),
      priceTrip: '1.50'),
  Trip(
    carOwnerName: "Ahmed",
    seatNumber: 4,
    startPoint: "Amman",
    endPoint: "Irbid",
    description: "Any Pinot",
    tripTime: DateTime.now(),
    priceTrip: '1.00',
  ),
  Trip(
    carOwnerName: "Eyass",
    seatNumber: 4,
    startPoint: "Al Jabber",
    endPoint: "Boulevard",
    description: "Any Pinot",
    tripTime: DateTime.now(),
    priceTrip: '1.00',
  ),
  Trip(
      carOwnerName: "Mohammad",
      seatNumber: 3,
      startPoint: "Zarqa",
      endPoint: "Just",
      description: "Any Pinot",
      tripTime: DateTime.now(),
      priceTrip: '1.50'),
  Trip(
    carOwnerName: "Ahmed",
    seatNumber: 4,
    startPoint: "Amman",
    endPoint: "Irbid",
    description: "Any Pinot",
    tripTime: DateTime.now(),
    priceTrip: '1.00',
  ),
];

String formatDat() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('MM-dd').format(now);
  String formattedTime = DateFormat('hh:mm').format(now);

  return '$formattedDate | $formattedTime';
}

bool registerCars = false;


String format__Dat(DateTime d) {
  String formattedDate = DateFormat('MM-dd').format(d);
  String formattedTime = DateFormat('hh:mm a').format(d);

  return '$formattedDate | $formattedTime';
}