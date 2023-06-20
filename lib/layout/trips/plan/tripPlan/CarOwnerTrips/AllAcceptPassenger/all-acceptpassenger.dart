import 'package:drive_share/layout/home_page.dart';
import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../models/components/components.dart';

class AllAcceptsTrips extends StatefulWidget {
  const AllAcceptsTrips({Key? key}) : super(key: key);

  @override
  State<AllAcceptsTrips> createState() => _AllAcceptsTripsState();
}

class _AllAcceptsTripsState extends State<AllAcceptsTrips> {
  void openWhatsAppChat(String phoneNumber) async {
    String whatsappUrl = "https://wa.me/";
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      Fluttertoast.showToast(
        msg: "Could not open WhatsApp",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsCubit, TripState>(
      listener: (context, state) {
        if (TripsCubit.get(context).ListRequestsPassenger.isEmpty) {
          Fluttertoast.showToast(
            msg: "لا يوجد اي طلب للرحلة ",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Color.fromARGB(255, 218, 10, 10),
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      builder: (context, state) {
        var requestsPassenger = TripsCubit.get(context).ListRequestsPassenger;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Accepts Trip'),
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
                            borderRadius: BorderRadius.circular(30),
                          ),
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
                                        backgroundImage: AssetImage(
                                            'images/Untitled-2.png'),
                                        radius: 20,
                                      ),
                                      const SizedBox(
                                        width: 80,
                                      ),
                                      Text(
                                        'Accept #${index + 1}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
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
                                              'First Name:',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                requestsPassenger[index]
                                                    .fname
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.black38,
                                                ),
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
                                              'Last Name:',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                requestsPassenger[index]
                                                    .lname
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.black38,
                                                ),
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
                                              'Phone Number: ',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                requestsPassenger[index]
                                                    .phonenumber
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.black38,
                                                ),
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
                                              'Gender:',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                requestsPassenger[index]
                                                    .gender
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w800,
                                                  color: Colors.black38,
                                                ),
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
                                  child: largeButton(
                                    text: 'Open WhatsApp Chat',
                                    onPressed: () {
                                      String phoneNumber =
                                          requestsPassenger[index]
                                              .phonenumber
                                              .toString();
                                                  launch('https://wa.me/$phoneNumber');

//openWhatsAppChat(phoneNumber);
                                    },
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
