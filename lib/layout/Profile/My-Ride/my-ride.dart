import 'package:drive_share/layout/Profile/My-Ride/details-my-trip.dart';
import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:drive_share/layout/trips/plan/tripPlan/CarOwnerTrips/AllAcceptPassenger/search-accept.dart';
import 'package:drive_share/layout/trips/plan/tripPlan/planD/plan_trip.dart';
import 'package:drive_share/teest.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../models/components/components.dart';

class MyRidee extends StatefulWidget {
  const MyRidee({super.key});

  @override
  State<MyRidee> createState() => _MyRideeState();
}

class _MyRideeState extends State<MyRidee> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsCubit, TripState>(
      listener: (context, state) {
        if (TripsCubit.get(context).myRide.isEmpty) {
          Fluttertoast.showToast(
              msg: " لا يوجد اي رحلة لك ",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: const Color.fromARGB(255, 218, 10, 10),
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        var rides = TripsCubit.get(context).myRide;

        return Scaffold(
          appBar: AppBar(
            title: const Text('My Ride'),
          ),
          body: ConditionalBuilder(
            condition: state is! UserInfoLoadingState,
            builder: (context) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: SizedBox(
                        height: 250,
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
                                Expanded(
                                  child: Row(
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
                                        'Trip Details #' +
                                            (index + 1).toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Expanded(
                                  child: Row(
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
                                            Expanded(
                                              child: Text(
                                                '${rides[index]
                                                    .fname} ${rides[index].lname}' ,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w800,
                                                    color: Colors.black38),
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
                                              'Seat Number :',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54),
                                            ),
                                            Expanded(
                                              child: Text(
                                                rides[index]
                                                    .seatnumber
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 12,
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
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: Row(
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
                                            Expanded(
                                              child: Text(
                                                rides[index]
                                                    .startpoint
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w800,
                                                    color: Colors.black38),
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
                                              'End Point :',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54),
                                            ),
                                            Expanded(
                                              child: Text(
                                                rides[index]
                                                    .endpoint
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 12,
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
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: Row(
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
                                            Expanded(
                                              child: Text(
                                                (rides[index].rideprice != 0)
                                                    ? '${rides[index].rideprice} JD'
                                                    : 'Free',
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green),
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
                                              'Trip Time :',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54),
                                            ),
                                            Expanded(
                                              child: Text(
                                                format__Dat(DateTime.parse(
                                                    rides[index]
                                                        .triptime
                                                        .toString())),
                                                style: const TextStyle(
                                                    fontSize: 12,
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
                                const SizedBox(
                                  height: 15,
                                ),
                                   Expanded(
                                              child:
                                                    largeButton(
                                                       
                                                        text: 'Details Trip',
                                                        onPressed: () async {

                                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyRideDetails(
                                                          trip: rides[index],
                                                          index: 1 + index),
                                                ),
                                              );
                                                        })
                                              
                                            ),
                              
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: rides.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Color.fromARGB(255, 3, 184, 78),
                  thickness: 0,
                  height: 0,
                );
              },
            ),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
