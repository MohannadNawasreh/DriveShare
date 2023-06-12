import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:drive_share/layout/home_page.dart';
import 'package:drive_share/layout/trip_post.dart';
import 'package:drive_share/models/trip.dart';
import 'package:drive_share/network/remote/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../models/components/components.dart';
import '../trips/cubit/cubit.dart';
import '../trips/cubit/states.dart';

class TripDetails extends StatelessWidget {
  final TripGp trip;
  final int index;
  //String passengerIdString = CacheHelper.getData(key: "Passengerid").toString();
  int passengerid =
      int.parse(CacheHelper.getData(key: "Passengerid").toString());
  TripDetails({super.key, required this.trip, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripsCubit(),
      child: BlocConsumer<TripsCubit, TripState>(listener: (context, state) {
        if (state is RequestSuccessState) {
          Fluttertoast.showToast(
              msg: 'Request Sent successfully',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Color.fromARGB(255, 3, 184, 78),
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          Fluttertoast.showToast(
              msg: 'Wrong Request',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Color.fromARGB(255, 184, 3, 3),
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Trip Details #$index'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'Car Owner: ',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              Expanded(
                                child: Text(
                                  trip.carownerid.toString(),
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black38),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'Seat Number : ',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              Expanded(
                                child: Text(
                                  trip.seatnumber.toString(),
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black38),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'Start Point  :',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              Expanded(
                                child: Text(
                                  trip.startpoint.toString(),
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black38),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'End Point :',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              Expanded(
                                child: Text(
                                  trip.endpoint.toString(),
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black38),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'Price :',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              Expanded(
                                child: Text(
                                  (trip.rideprice != 0)
                                      ? '${trip.rideprice} JD'
                                      : 'Free',
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'Trip Time :',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              Expanded(
                                child: Text(
                                  formatDat(),
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black38),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  'Description :',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                  child: Expanded(
                    child: Text(
                      trip.descreption.toString(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black38),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  'Status :',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
                  child: Expanded(
                    child: Text(
                      "Pending",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black38),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Expanded(
                    child: Row(
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
                                
                        Expanded(
                          child: ConditionalBuilder(
                                  condition: state is! RequestLoadingState,
                                  builder: (context) => largeButton(
                            text: 'Request to join the trip',
                            onPressed: () {
                              TripsCubit().RequestTrip(
                                  tripid: trip.tripid,
                                  passengerid: passengerid);
                            },
                          ), 
                                  fallback: (context) => const Center(
                                      child: CircularProgressIndicator()),
                                ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
