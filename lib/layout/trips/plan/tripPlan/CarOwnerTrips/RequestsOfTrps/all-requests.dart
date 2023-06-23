import 'package:drive_share/layout/home_page.dart';
import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:drive_share/layout/trips/plan/tripPlan/CarOwnerTrips/search-carowner-trip.dart';
import 'package:drive_share/layout/trips/plan/tripPlan/planD/plan_trip.dart';
import 'package:drive_share/network/remote/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../../models/components/components.dart';

class AllRequestsTrips extends StatefulWidget {
  const AllRequestsTrips({super.key});

  @override
  State<AllRequestsTrips> createState() => _AllRequestsTripsState();
}

class _AllRequestsTripsState extends State<AllRequestsTrips> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsCubit, TripState>(
      listener: (context, state) {
        if (state is CarOwnerTripsSuccessState) {
            Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const SearchCarOwnerTrips()),
                                                          );
          Fluttertoast.showToast(
              msg: "تم قبول الطلب  ",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Color.fromARGB(255, 3, 184, 78),
              textColor: Colors.white,
              fontSize: 16.0);

        } else if(state is CarOwnerTripsErrorState) {
          Fluttertoast.showToast(
              msg: "حدث خطأ ما , حاول مره اخرى ",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Color.fromARGB(255, 218, 10, 10),
              textColor: Colors.white,
              fontSize: 16.0);
        }

        if (TripsCubit.get(context).ListRequestsPassenger.isEmpty) {
                 Fluttertoast.showToast(
              msg: "لا يوجد اي طلب للرحلة ",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Color.fromARGB(255, 218, 10, 10),
              textColor: Colors.white,
              fontSize: 16.0);
        }
       
              },
      builder: (context, state) {
        var requestsPassenger = TripsCubit.get(context).ListRequestsPassenger;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Requests Trip'),
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
                                            AssetImage('images/user.png'),
                                        radius: 20,
                                      ),
                                      const SizedBox(
                                        width: 60,
                                      ),
                                      Text(
                                        // ignore: prefer_interpolation_to_compose_strings
                                        'Request #' +
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
                                              'First Name :',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54),
                                            ),
                                            Expanded(
                                              child: Text(
                                                requestsPassenger[index]
                                                    .fname
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
                                              'Last Name :',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54),
                                            ),
                                            Expanded(
                                              child: Text(
                                                requestsPassenger[index]
                                                    .lname
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
                                              'Phone Number : ',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54),
                                            ),
                                            Expanded(
                                              child: Text(
                                                requestsPassenger[index]
                                                    .phonenumber
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
                                              'Gender :',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54),
                                            ),
                                            Expanded(
                                              child: Text(
                                                requestsPassenger[index]
                                                    .gender
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
                                  height: 15,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: ConditionalBuilder(
                                                condition: state
                                                    is! TripPlanLoadingState,
                                                builder: (context) =>
                                                    smallButton(
                                                        text: 'Accept',
                                                        onPressed: () async {
                                                          print(CacheHelper.getData(
                                                                      key:
                                                                          'tripId')
                                                                  .toString() +
                                                              '  fff ' +
                                                              requestsPassenger[
                                                                      index]
                                                                  .passengerid
                                                                  .toString());

                                                          int id = int.parse(
                                                              CacheHelper.getData(
                                                                      key:
                                                                          'tripId')
                                                                  .toString());

                                                          TripsCubit.get(context).AcceptPassenger(
                                                              tripid: id,
                                                              passngerid: int.parse(
                                                                  requestsPassenger[
                                                                          index]
                                                                      .passengerid
                                                                      .toString()));
                                                        }),
                                                fallback: (context) => const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: ConditionalBuilder(
                                                condition: state
                                                    is! TripPlanLoadingState,
                                                builder: (context) =>
                                                    smallButton(
                                                        text: 'Reject',
                                                        onPressed: () async {}),
                                                fallback: (context) => const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                              ),
                                            ),
                                            SizedBox(
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: requestsPassenger.length,
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
