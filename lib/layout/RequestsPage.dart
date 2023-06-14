import 'package:drive_share/layout/trips/Find/trip_details_page.dart';
import 'package:drive_share/models/Passenger.dart';
import 'package:drive_share/models/trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/components/components.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({Key? key}) : super(key: key);

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  late List<bool> isButtonDisabled;
  List<PassengerGp> listPassenger = [
    PassengerGp(fname: 'fname', lname: 'lname', phonenumber: 'phonenumber', username: 'username', imagefile: 'imagefile')
  ];
  
  @override
  void initState() {
    super.initState();
    
    isButtonDisabled = List<bool>.generate(listPassenger.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ride Requests'),
      ),
      body: ListView.builder(
        itemCount: listPassenger.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Colors.white,
                    shadowColor: Colors.black54,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage:
                                      AssetImage('images/Untitled-2.png'),
                                  radius: 20,
                                ),
                                const SizedBox(
                                  width: 80,
                                ),
                                Text(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  'Passenger Details #' +
                                      (index + 1).toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
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
                                        'Passenger:',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      Text(
                                        listPassenger[index].fname.toString(),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black38,
                                        ),
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
                                        'Mobile:',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      Text(
                                        listPassenger[index].phonenumber.toString(),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black38,
                                        ),
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
                                        'Start Point:',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      Text("lorem ipsum",
                                        //listTrip[index].startPoint.toString(),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black38,
                                        ),
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
                                        'End Point:',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      Text(
                                        listPassenger[index].passengerid.toString(),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black38,
                                        ),
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
                                // Expanded(
                                //   child: Row(
                                //     children: [
                                //       const Text(
                                //         'Price:',
                                //         style: TextStyle(
                                //           fontSize: 15,
                                //           fontWeight: FontWeight.bold,
                                //           color: Colors.black54,
                                //         ),
                                //       ),
                                //       Text(
                                //         (listTrip[index].priceTrip != 'Free')
                                //             ? '${listTrip[index].priceTrip} JD'
                                //             : 'Free',
                                //         style: const TextStyle(
                                //           fontSize: 15,
                                //           fontWeight: FontWeight.bold,
                                //           color: Colors.green,
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Trip Time:',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      Text(
                                        formatDat(),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black38,
                                        ),
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
                                ElevatedButton(
                                  onPressed: isButtonDisabled[index]
                                      ? null
                                      : () {
                                          setState(() {
                                            isButtonDisabled[index] = true;
                                          });
                                          // Perform accept logic
                                        },
                                  child: const Text('Accept'),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: isButtonDisabled[index]
                                      ? null
                                      : () {
                                          setState(() {
                                            isButtonDisabled[index] = true;
                                          });
                                          // Perform reject logic
                                        },
                                  child: const Text('Reject'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
