import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Find/trip_details_page.dart';
import '../../models/components/components.dart';

class AllTripsCards extends StatefulWidget {
  const AllTripsCards({super.key});

  @override
  State<AllTripsCards> createState() => _AllTripsCardsState();
}

class _AllTripsCardsState extends State<AllTripsCards> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsCubit, TripState>(
      listener: (context, state) {},
      builder: (context, state) {
        var trips = TripsCubit.get(context).ListtTrips;

        return Scaffold(
          appBar: AppBar(
            title: Text('All Trip'),
          ),
          body: ConditionalBuilder(
            condition: state is! TripPlanLoadingState,
            builder: (context) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
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
                                                trips[index]
                                                    .carownerid
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
                                              'Seat Number :',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54),
                                            ),
                                            Expanded(
                                              child: Text(
                                                trips[index]
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
                                                trips[index]
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
                                                trips[index]
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
                                                (trips[index].rideprice != 0)
                                                    ? '${trips[index].rideprice} JD'
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
                                                    trips[index]
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
                                        child: largeButton(
                                          text: 'Join in Trip',
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TripDetails(
                                                        trip: trips[index],
                                                        index: 1 + index),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
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
              itemCount: trips.length,
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
