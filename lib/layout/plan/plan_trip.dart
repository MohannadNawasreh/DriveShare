import 'package:drive_share/models/components/components.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/trip.dart';

class PlanTrip extends StatefulWidget {
  const PlanTrip({super.key});

  @override
  State<PlanTrip> createState() => _PlanTripState();
}

class _PlanTripState extends State<PlanTrip> {
  final formKey = GlobalKey<FormState>();


  Trip newTrip = Trip(
    carOwnerName: '',
    seatNumber: 0,
    startPoint: '',
    endPoint: '',
    description: '',
    tripTime: DateTime.now(),
    priceTrip: '',
  );


  @override
  Widget build(BuildContext context) {
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
                  onSaved: (value) {
                    newTrip.startPoint = value;
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
                    newTrip.endPoint = value;
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
                    newTrip.seatNumber = int.parse(value.toString());
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
                    newTrip.description = value;
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
                      );

                      if (selectedTime != null) {
                        // Combine date and time
                        setState(() {
                          newTrip.tripTime = DateTime(
                            selectedDate.year,
                            selectedDate.month,
                            selectedDate.day,
                            selectedTime.hour,
                            selectedTime.minute,
                          );
                        });
                      }
                    }
                  },
                  readOnly: true,
                  validator: (value) {
                    if (newTrip.tripTime == null) {
                      return 'Please select trip time';
                    }
                    return null;
                  },
                  controller: TextEditingController(
                    text: newTrip.tripTime != null
                        ? DateFormat('hh:mm a | d-M-yyyy')
                            .format(DateTime.parse(newTrip.tripTime.toString()))
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
                    newTrip.priceTrip = value;
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              largeButton(
                text: 'Create Trip',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    //  createTrip();
                    print(newTrip.seatNumber);
                    print(newTrip.startPoint);
                    print(format__Dat(
                        DateTime.parse(newTrip.tripTime.toString())));
                    print(newTrip.endPoint);

                    print(newTrip.description);
                    print(newTrip.priceTrip);

                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
