import 'package:drive_share/layout/trip_details_page.dart';
import 'package:drive_share/models/trip.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget largeButton({
  double width = 180,
    Color back =const Color.fromARGB(255, 3, 184, 78) ,
  required String text,
  required Function() onPressed,
}) {
  return Container(
    width: width,
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
          backgroundColor: back,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    ),
  );
}

Widget smallButton({
  double width = 100,
  Color back =const Color.fromARGB(255, 3, 184, 78) ,
  required String text,
  required Function() onPressed,
}) {
  return Container(
    width: width,
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
          backgroundColor: back,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    ),
  );
}

 


String formatDat() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('MM-dd').format(now);
  String formattedTime = DateFormat('hh:mm').format(now);

  return '$formattedDate | $formattedTime';
}


String format__Dat(DateTime d) {
  String formattedDate = DateFormat('MM-dd').format(d);
  String formattedTime = DateFormat('hh:mm a').format(d);

  return '$formattedDate | $formattedTime';
}

Widget buildTripPostList(BuildContext context, trips , index) =>
GestureDetector(
  onTap: () {
    // Navigate to a new page with the card information
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>  TripDetails(trip: trips, index: index,),
      ),
    );
  },
   child:
   Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: SizedBox(
            height: 220,
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Colors.white,
              shadowColor: Colors.black54,
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children:  [
                        const CircleAvatar(
                          backgroundImage: AssetImage('images/Untitled-2.png'),
                          radius: 20,
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        Text(
                          // ignore: prefer_interpolation_to_compose_strings
                          'Trip Details #' +
                           (index + 1).toString(),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'Car Owner:',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              Text(
                                trips['carownerid'].toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black38),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'Seat Number :',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              Text(
                                trips['seatnumber'].toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black38),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'Start Point  :',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              Text(
                                trips['startpoint'].toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black38),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'End Point :',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              Text(
                                trips['endpoint'].toString(),
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black38),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'Price :',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              Text(
                                (trips['rideprice'] != 0)
                                    ? trips['rideprice'].toString() + 'JD'
                                    : 'Free',
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'Trip Time :',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              Text(
                                format__Dat(DateTime.parse(trips['triptime'].toString())),
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black38),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        /*  TextButton(
                              onPressed: () {},
                              child: Text('Join in Trip'),
                              style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 3, 184, 78),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                            ),*/
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    )
);