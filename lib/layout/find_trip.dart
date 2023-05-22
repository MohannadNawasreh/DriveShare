import 'package:drive_share/layout/trip_post.dart';
import 'package:drive_share/models/components/components.dart';
import 'package:flutter/material.dart';

class FindTrip extends StatefulWidget {
  const FindTrip({super.key});

  @override
  State<FindTrip> createState() => _FindTripState();
}

class _FindTripState extends State<FindTrip> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: smallButton(
          text: 'All Tips ',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TripCard(),
              ),
            );
          }),
    );
  }
}
