import 'dart:convert';
import 'package:drive_share/layout/trips/plan/tripPlan/CarOwnerTrips/search-carowner-trip.dart';
import 'package:http/http.dart' as http;

import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:drive_share/layout/trips/plan/tripPlan/CarOwnerTrips/AllAcceptPassenger/search-accept.dart';
import 'package:drive_share/layout/trips/plan/tripPlan/CarOwnerTrips/UpdateTrip/update-trip.dart';
import 'package:drive_share/layout/trips/plan/tripPlan/planD/plan_trip.dart';
import 'package:drive_share/teest.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../models/components/components.dart';
import 'RequestsOfTrps/search-requests.dart';

class CarOwnerTrips extends StatefulWidget {
  const CarOwnerTrips({super.key});

  @override
  State<CarOwnerTrips> createState() => _CarOwnerTripsState();
}

class _CarOwnerTripsState extends State<CarOwnerTrips> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsCubit, TripState>(
      listener: (context, state) {
        if (TripsCubit.get(context).CarOwnerTrips.isEmpty &&
            state is TripPlanErrorState) {
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
        var trips = TripsCubit.get(context).CarOwnerTrips;
        var user = TripsCubit.get(context).UserInfo;

        /*     if (trips.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Car Owner Trip'),
            ),
            body: Center(
              child: largeButton(
                  text: 'Go To Plan Tips',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PlanTrip()));
                  }),
            ),
          );
        }*/
        return Scaffold(
          appBar: AppBar(
            title: const Text('Car Owner Trip'),
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
                        height: 300,
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
                                                '${user.fname} ${user.lname}',
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
                                      Expanded(
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: ConditionalBuilder(
                                                condition: state
                                                    is! TripPlanLoadingState,
                                                builder: (context) =>
                                                    smallButton(
                                                        back: const Color
                                                                .fromARGB(
                                                            255, 117, 123, 125),
                                                        text:
                                                            'All trip requests',
                                                        onPressed: () async {
                                                          print('object');
                                                          print(trips[index]
                                                              .tripid);

                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          SearchRequests(
                                                                            tripId:
                                                                                trips[index].tripid,
                                                                          )));
                                                        }),
                                                fallback: (context) => const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: ConditionalBuilder(
                                                condition: state
                                                    is! TripPlanLoadingState,
                                                builder: (context) => smallButton(
                                                    text: "Accepted",
                                                    onPressed: () async {
                                                      print('object');
                                                      print(
                                                          trips[index].tripid);

                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  SearchAccepts(
                                                                    tripId: trips[
                                                                            index]
                                                                        .tripid,
                                                                  )));
                                                    }),
                                                fallback: (context) => const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      )
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
                                      Expanded(
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: ConditionalBuilder(
                                                condition: state
                                                    is! TripPlanLoadingState,
                                                builder: (context) =>
                                                    smallButton(
                                                        back: Colors.red,
                                                        text: 'Delete Trip',
                                                        onPressed: () async {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    "Deleted Trip",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red)),
                                                                content: Text(
                                                                    "Are you sure to delete?"),
                                                                actions: [
                                                                  smallButton(
                                                                      text:
                                                                          "Yes",
                                                                      onPressed:
                                                                          () async {
                                                                        var headers =
                                                                            {
                                                                          'Content-Type':
                                                                              'application/json',
                                                                          'Cookie':
                                                                              'ARRAffinity=db7caaae5eca3babc5f5f4457fe724cbbbf257aeb4789bd12dc6351f9c66004b; ARRAffinitySameSite=db7caaae5eca3babc5f5f4457fe724cbbbf257aeb4789bd12dc6351f9c66004b'
                                                                        };
                                                                        var request = http.Request(
                                                                            'DELETE',
                                                                            Uri.parse('https://driveshare.azurewebsites.net/api/CarOwner/deletetrip'));
                                                                        request.body =
                                                                            json.encode({
                                                                          "TID":
                                                                              trips[index].tripid
                                                                        });
                                                                        request
                                                                            .headers
                                                                            .addAll(headers);

                                                                        http.StreamedResponse
                                                                            response =
                                                                            await request.send();

                                                                        if (response.statusCode ==
                                                                            200) {
                                                                          print(
                                                                              response.statusCode);

                                                                          Fluttertoast.showToast(
                                                                              msg: "تم حذف الرحبة بنجاح ",
                                                                              toastLength: Toast.LENGTH_LONG,
                                                                              gravity: ToastGravity.BOTTOM,
                                                                              timeInSecForIosWeb: 5,
                                                                              backgroundColor: Color.fromARGB(255, 3, 184, 78),
                                                                              textColor: Colors.white,
                                                                              fontSize: 16.0);

                                                                          Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(builder: (context) => const SearchCarOwnerTrips()));
                                                                        } else {
                                                                          print(
                                                                              response.statusCode);

                                                                          Fluttertoast.showToast(
                                                                              msg: "اعد المحاوله مره اخرى ",
                                                                              toastLength: Toast.LENGTH_LONG,
                                                                              gravity: ToastGravity.BOTTOM,
                                                                              timeInSecForIosWeb: 5,
                                                                              backgroundColor: Colors.red,
                                                                              textColor: Colors.white,
                                                                              fontSize: 16.0);
                                                                        }

                                                                        /*     Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginLayout()));*/
                                                                      }),
                                                                  smallButton(
                                                                      text:
                                                                          "No",
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      }),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        }),
                                                fallback: (context) => const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: ConditionalBuilder(
                                                condition: state
                                                    is! TripPlanLoadingState,
                                                builder: (context) =>
                                                    smallButton(
                                                        back: Colors.orange,
                                                        text: 'Edit Trip',
                                                        onPressed: () async {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    UpdateTrip(
                                                                        trip: trips[
                                                                            index])),
                                                          );
                                                        }),
                                                fallback: (context) => const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),

                                        /*     child: largeButton(
                                            text: 'Requests of Trip',
                                            onPressed: () {
                                            /*  Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => RequestsPage(),
                                              );*/
                                            },
                                          ),*/
                                      )
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
                                      Expanded(
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: ConditionalBuilder(
                                                condition: state
                                                    is! TripPlanLoadingState,
                                                builder: (context) =>
                                                    smallButton(
                                                  back:
                                                      trips[index].isactive == 2
                                                          ? Colors.red
                                                          : Colors.green,
                                                  text: trips[index].isactive ==
                                                          2
                                                      ? 'Trip is Finished'
                                                      : trips[index].isactive ==
                                                              1
                                                          ? 'Trip started , Click to End Trip'
                                                          : 'The trip is active',
                                                  onPressed: () async {
                                                    if (trips[index].isactive ==
                                                        0) {
                                                      print(
                                                          '${trips[index].tripid}999999999999999999999999');
                                                      TripsCubit.get(context)
                                                          .ActiveTrip(
                                                              tripid:
                                                                  trips[index]
                                                                      .tripid);
                                                      Fluttertoast.showToast(
                                                          msg: "Trip is Active",
                                                          toastLength:
                                                              Toast.LENGTH_LONG,
                                                          gravity: ToastGravity
                                                              .BOTTOM,
                                                          timeInSecForIosWeb: 5,
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  3,
                                                                  141,
                                                                  54),
                                                          textColor:
                                                              Colors.white,
                                                          fontSize: 16.0);

                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const PlanTrip()));
                                                    } else if (trips[index]
                                                            .isactive ==
                                                        1) {
                                                      TripsCubit.get(context)
                                                          .FinishTrip(
                                                              tripid:
                                                                  trips[index]
                                                                      .tripid);

                                                      Fluttertoast.showToast(
                                                          msg: "Trip is Finished",
                                                          toastLength:
                                                              Toast.LENGTH_LONG,
                                                          gravity: ToastGravity
                                                              .BOTTOM,
                                                          timeInSecForIosWeb: 5,
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  3,
                                                                  141,
                                                                  54),
                                                          textColor:
                                                              Colors.white,
                                                          fontSize: 16.0);
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const PlanTrip()));
                                                    } else {
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              "Trip Already Finished",
                                                          toastLength:
                                                              Toast.LENGTH_LONG,
                                                          gravity: ToastGravity
                                                              .BOTTOM,
                                                          timeInSecForIosWeb: 5,
                                                          backgroundColor:
                                                              Colors.orange,
                                                          textColor:
                                                              Colors.white,
                                                          fontSize: 16.0);
                                                    }
                                                  },
                                                ),
                                                fallback: (context) => const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                              ),
                                            ),
                                            /*  const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: ConditionalBuilder(
                                                condition: state
                                                    is! TripPlanLoadingState,
                                                builder: (context) =>
                                                    smallButton(
                                                        back: const Color
                                                                .fromARGB(
                                                            255, 117, 123, 125),
                                                        text: 'Finish Trip',
                                                        onPressed: () async {
                                                          TripsCubit.get(
                                                                  context)
                                                              .FinishTrip(
                                                                  tripid: trips[
                                                                          index]
                                                                      .tripid);

                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  "Trip is Finish",
                                                              toastLength: Toast
                                                                  .LENGTH_LONG,
                                                              gravity:
                                                                  ToastGravity
                                                                      .BOTTOM,
                                                              timeInSecForIosWeb:
                                                                  5,
                                                              backgroundColor:
                                                                  Color
                                                                      .fromARGB(
                                                                          255,
                                                                          3,
                                                                          141,
                                                                          54),
                                                              textColor:
                                                                  Colors.white,
                                                              fontSize: 16.0);
                                                        }),
                                                fallback: (context) => const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                              ),
                                            ),*/
                                            const SizedBox(
                                              width: 10,
                                            ),
                                          ],
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
                  color: Color.fromARGB(255, 255, 255, 255),
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
