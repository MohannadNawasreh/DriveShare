import 'package:drive_share/models/components/components.dart';
import 'package:flutter/material.dart';

class TripCard extends StatefulWidget {
  const TripCard({super.key});

  @override
  State<TripCard> createState() => _TripCardState();
}

class _TripCardState extends State<TripCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trips'),
      ),
      body: Column(
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
                        children: const [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('images/Untitled-2.png'),
                            radius: 20,
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Text(
                            'Trip Details',
                            style: TextStyle(
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
                              children: const [
                                Text(
                                  'Car Owner:',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(
                                  '"Name CarOwner"',
                                  style: TextStyle(
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
                              children: const [
                                Text(
                                  'Seat Number :',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(
                                  '"Number"',
                                  style: TextStyle(
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
                              children: const [
                                Text(
                                  'Start Point  :',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(
                                  '"StartPoint"',
                                  style: TextStyle(
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
                              children: const [
                                Text(
                                  'End Point :',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(
                                  '"EndPoint "',
                                  style: TextStyle(
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
                              children: const [
                                Text(
                                  'Description :',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(
                                  '"Description "',
                                  style: TextStyle(
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
                              children: const [
                                Text(
                                  'Trip Time :',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(
                                  '7-5-2023 12:00m',
                                  style: TextStyle(
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
                        children: [
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
                          largeButton(
                            text: 'Join in Trip',
                            onPressed: () {},
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
                        children: const [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('images/Untitled-2.png'),
                            radius: 20,
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Text(
                            'Trip Details',
                            style: TextStyle(
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
                              children: const [
                                Text(
                                  'Car Owner:',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(
                                  '"Name CarOwner"',
                                  style: TextStyle(
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
                              children: const [
                                Text(
                                  'Seat Number :',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(
                                  '"Number"',
                                  style: TextStyle(
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
                              children: const [
                                Text(
                                  'Start Point  :',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(
                                  '"StartPoint"',
                                  style: TextStyle(
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
                              children: const [
                                Text(
                                  'End Point :',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(
                                  '"EndPoint "',
                                  style: TextStyle(
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
                              children: const [
                                Text(
                                  'Description :',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(
                                  '"Description "',
                                  style: TextStyle(
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
                              children: const [
                                Text(
                                  'Trip Time :',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(
                                  '7-5-2023 12:00m',
                                  style: TextStyle(
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
                        children: [
                          largeButton(
                            text: 'Join in Trip',
                            onPressed: () {},
                          )
                          /*     TextButton(
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
      ),
    );
  }
}
