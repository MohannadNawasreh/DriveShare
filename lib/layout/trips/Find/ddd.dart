import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:drive_share/layout/home_page.dart';
import 'package:drive_share/http/trip_post.dart';
import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:drive_share/models/components/components.dart';
import 'package:drive_share/models/myTrips.dart';
import 'package:drive_share/models/trip.dart';
import 'package:drive_share/network/remote/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class RideDetails extends StatelessWidget {
  final MyRide trip;
  final int index;
  //String passengerIdString = CacheHelper.getData(key: "Passengerid").toString();
  int passengerid =
      int.parse(CacheHelper.getData(key: "Passengerid").toString());
  RideDetails({
    super.key,
    required this.trip,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TripsCubit(),
      child: BlocConsumer<TripsCubit, TripState>(listener: (context, state) {
        Fluttertoast.showToast(
            msg: 'Request Sent successfully',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: const Color.fromARGB(255, 3, 184, 78),
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            /*         leading: IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  SearchProfile()),
                );
              },
            ),*/
            title: const Text('Trip'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
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
                              children: const [
                                SizedBox(
                                  width: 110,
                                ),
                                Text(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  'Trip Details',
                                  style: TextStyle(
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
                                        'Driver Name : ',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${trip.fname} ${trip.lname}',
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
                                        'Car Type :',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                      Expanded(
                                        child: Text(
                                          trip.cartype.toString(),
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
                                        'Car Model :',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                      Expanded(
                                        child: Text(
                                          trip.carmmodel.toString(),
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
                                        'Car Number :',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                      Expanded(
                                        child: Text(
                                          trip.carnumber.toString(),
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
                                        'Car Year :',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                      Expanded(
                                        child: Text(
                                          trip.carmodel.toString(),
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
                                        'Drive Phone :',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                      Expanded(
                                        child: Text(
                                          trip.phonenumber.toString(),
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
                                        'Start Point :',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                      Expanded(
                                        child: Text(
                                          trip.startpoint.toString(),
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
                                          trip.endpoint.toString(),
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
                                        'Seat Number :',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                      Expanded(
                                        child: Text(
                                          trip.seatnumber.toString(),
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
                                        'Price :',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                      Expanded(
                                        child: Text(
                                          (trip.rideprice != 0)
                                              ? '${trip.rideprice} JD'
                                              : 'Free',
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
                                        'Trip Time :',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                      Expanded(
                                        child: Text(
                                          format__Dat(DateTime.parse(
                                              trip.triptime.toString())),
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
                          Expanded(
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    'Description :',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    trip.descreption ?? '',
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black38),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'SP1: ${trip.sp1 ?? ' '}    SP2: ${trip.sp3 ?? ''} \n SP3: ${trip.sp3 ?? ''}    SP4: ${trip.sp4 ?? ''}',
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black38),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: ConditionalBuilder(
                                    condition: state is! RequestLoadingState,
                                    builder: (context) => largeButton(
                                      text: 'Request Join Trip',
                                      onPressed: () async {
                                        TripsCubit().RequestTrip(
                                            tripid: trip.tripid!,
                                            passengerid: passengerid);

                                        Fluttertoast.showToast(
                                            msg: 'Request Sent successfully',
                                            toastLength: Toast.LENGTH_LONG,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 3,
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 3, 184, 78),
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage()),
                                        );
                                      },
                                    ),
                                    fallback: (context) => const Center(
                                        child: CircularProgressIndicator()),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                largeButton(
                                  text: 'WhatsApp Driver',
                                  onPressed: () {
                                    String phoneNumber =
                                        trip.phonenumber.toString();
                                    launch('https://wa.me/$phoneNumber');

                                  },
                                ),
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
          ),
        );
      }),
    );
  }
}
