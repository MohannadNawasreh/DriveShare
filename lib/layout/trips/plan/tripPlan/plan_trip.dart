import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:drive_share/models/components/components.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PlanTrip extends StatefulWidget {
  const PlanTrip({super.key});

  @override
  State<PlanTrip> createState() => _PlanTripState();
}

class _PlanTripState extends State<PlanTrip> {
  final formKey = GlobalKey<FormState>();

  TextEditingController seatNumberController = TextEditingController();
  TextEditingController startPointController = TextEditingController();
  TextEditingController endPointController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime tripTimeD = DateTime.now();
  TextEditingController tripTimeController = TextEditingController();

  TextEditingController priceTripController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TripsCubit(),
      child: BlocConsumer<TripsCubit, TripState>(
          listener: (context, state) {
             if (state is TripPlanSuccessState) {
           
              print( 'Trip created successfully');
            
          } else if (state is TripPlanErrorState) {
            print( 'Trip created falid');
          }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                reverse: true,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Center(
                            child: Image.asset("images/Untitled-2.png",
                                width: 100, height: 100)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: startPointController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 3, 184, 78)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(
                              Icons.arrow_forward_sharp,
                              size: 20,
                            ),
                            hintText: "Start Point",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter start point';
                            }
                            return null;
                          },
                          onSaved: (value) {},
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: endPointController,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 3, 184, 78)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(
                              Icons.arrow_back,
                              size: 20,
                            ),
                            hintText: "End Point",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter End point';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            //newTrip.endPoint = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: seatNumberController,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 3, 184, 78)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(
                              Icons.event_seat_sharp,
                              size: 20,
                            ),
                            hintText: "Seat Number",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Seat Number';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            //  newTrip.seatNumber = int.parse(value.toString());
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: descriptionController,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 3, 184, 78)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(
                              Icons.description,
                              size: 20,
                            ),
                            hintText: "Description",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Description';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            //  newTrip.description = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 3, 184, 78)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(
                              Icons.access_time,
                              size: 20,
                            ),
                            hintText: "Trip Time",
                          ),
                          onTap: () async {
                            // Show date picker
                            DateTime? selectedDate = await showDatePicker(
                              // ...
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(Duration(days: 365)),
                            );

                            if (selectedDate != null) {
                              // Show time picker
                              TimeOfDay? selectedTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                // ...
                              );

                              if (selectedTime != null) {
                                setState(() {
                                  tripTimeD = DateTime(
                                    selectedDate.year,
                                    selectedDate.month,
                                    selectedDate.day,
                                    selectedTime.hour,
                                    selectedTime.minute,
                                  );
                                  // tripTimeController = selectedDateTime
                                });
                              }
                            }
                          },
                          readOnly: true,
                          validator: (value) {
                            if (tripTimeD == null) {
                              return 'Please select trip time';
                            }
                            return null;
                          },
                          controller: TextEditingController(
                            text: tripTimeD != null
                                ? DateFormat('hh:mm a | d-M-yyyy')
                                    .format(
                                        DateTime.parse(tripTimeD.toString()))
                                    .toString()
                                : '',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: priceTripController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 3, 184, 78)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            prefixIcon: const Icon(
                              Icons.attach_money_outlined,
                              size: 20,
                            ),
                            hintText: "Price Trip",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Price Trip';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // newTrip.priceTrip = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ConditionalBuilder(
                        condition: state is! TripPlanLoadingState,
                        builder: (context) => largeButton(
                            text: 'Create Trip',
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                TripsCubit.get(context).CreateTripPlan(
                                    startpoint: startPointController.text,
                                    endpoint: endPointController.text,
                                    descreption: descriptionController.text,
                                    seatnumber:
                                        int.parse(seatNumberController.text),
                                    triptime: tripTimeD,
                                    rideprice:
                                        int.parse(priceTripController.text),
                                    isactive: 1,
                                    carownerid: 2,
                                    sp1: 'ss',
                                    sp2: '',
                                    sp3: '',
                                    sp4: '',
                                    trippassengergps: []);
                              }
                            }),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                      /*  largeButton(
                        text: 'Create Trip',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                            print('Start Point: ${startPointController.text}');
                            print('End Point: ${endPointController.text}');
                            print('Seat Number: ${seatNumberController.text}');
                            print('Description: ${descriptionController.text}');
                            print(DateFormat('hh:mm a | d-M-yyyy')
                                .format(tripTimeD)
                                .toString());
                            print('Price Trip: ${priceTripController.text}');
                          }
                        },
                      ),*/
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
