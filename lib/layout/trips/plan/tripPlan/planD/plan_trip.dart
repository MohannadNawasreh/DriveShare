import 'dart:async';
import 'dart:convert';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:drive_share/layout/RequestsPage.dart';
import 'package:drive_share/layout/home_page.dart';
import 'package:drive_share/http/trip_post.dart';
import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:drive_share/models/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:http/http.dart' as http;

import '../../../../../network/remote/cache_helper.dart';
import 'register_car_page.dart';
import '../CarOwnerTrips/search-carowner-trip.dart';

class PlanTrip extends StatefulWidget {
  const PlanTrip({Key? key}) : super(key: key);

  @override
  _PlanTripState createState() => _PlanTripState();
}

class _PlanTripState extends State<PlanTrip> {
  // A Completer to hold a reference to the GoogleMapController
  Completer<GoogleMapController> _controller = Completer();
  // TextEditingControllers for the starting and ending points of the trip
  TextEditingController _startingPointController = TextEditingController();
  TextEditingController _endingPointController = TextEditingController();
  TextEditingController _stopPointController1 = TextEditingController();
  TextEditingController _stopPointController2 = TextEditingController();
  TextEditingController _stopPointController3 = TextEditingController();
  TextEditingController _stopPointController4 = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _seatController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  DateTime tripTimeD = DateTime.now();

  // TextEditingControllers for the date and time of the trip
  DateTime _selectedDate = DateTime.now();
  // A Set of Markers to display on the map
  Set<Marker> _markers = {};

  // The initial camera position for the map, centered on Amman, Jordan
  static final CameraPosition _amman = const CameraPosition(
    target: LatLng(31.9539, 35.9106),
    zoom: 14.4746,
  );

  // Function to display a DatePicker and update the selected date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(_selectedDate);
      });
    }
  }

  // Function to display a TimePicker and update the selected time
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDate),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = DateTime(
          _selectedDate.year,
          _selectedDate.month,
          _selectedDate.day,
          picked.hour,
          picked.minute,
        );
        _timeController.text = picked.format(context);
      });
    }
  }

  // Function to handle place selection from the GooglePlaceAutoCompleteTextField
  void onPlaceSelected(
      Prediction prediction, TextEditingController controller) async {
    if (prediction.placeId != null) {
      // Make a request to the Google Places API to retrieve place details
      final response = await http.get(Uri.parse(
          "https://maps.googleapis.com/maps/api/place/details/json?place_id=${prediction.placeId}&key=AIzaSyBcWrxVAb6P_xbwlklNviUfBKTJskgnJCo"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["status"] == "OK") {
          final detail = data["result"];
          controller.text = prediction.description ?? "";
          if (detail["geometry"]?["location"] != null) {
            final position = LatLng(
              detail["geometry"]["location"]["lat"],
              detail["geometry"]["location"]["lng"],
            );
            setState(() {
              // Add a Marker to the map at the selected location
              _markers.add(
                Marker(
                  markerId: MarkerId(prediction.placeId!),
                  position: position,
                ),
              );
            });
            // Move the map camera to the selected location
            final GoogleMapController mapController = await _controller.future;
            mapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(target: position, zoom: 15),
              ),
            );
          }
        }
      }
    }
  }

  void getPlaceDetailWithLatLng(Prediction prediction) async {
    if (prediction.placeId != null) {
      final response = await http.get(Uri.parse(
          "https://maps.googleapis.com/maps/api/place/details/json?place_id=${prediction.placeId}&key=AIzaSyBcWrxVAb6P_xbwlklNviUfBKTJskgnJCo"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data["status"] == "OK") {
          final detail = data["result"];
          if (detail["geometry"]?["location"] != null) {
            final position = LatLng(
              detail["geometry"]["location"]["lat"],
              detail["geometry"]["location"]["lng"],
            );
            setState(() {
              _markers.add(
                Marker(
                  markerId: MarkerId(prediction.placeId!),
                  position: position,
                ),
              );
            });
            final GoogleMapController mapController = await _controller.future;
            mapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(target: position, zoom: 15),
              ),
            );
          }
        }
      }
    }
  }

  Future<void> CheckC() async {
    TripsCubit.get(context).CheckCarowner();

    print(CacheHelper.getData(key: 'carownerid').toString() + '   CheckC    ');
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TripsCubit(),
      child: BlocConsumer<TripsCubit, TripState>(listener: (context, state) {
        if (state is TripPlanSuccessState) {
          print('Trip created successfully');

          Fluttertoast.showToast(
              msg: "تم انشاء الرحلة بنجاح ",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Color.fromARGB(255, 3, 184, 78),
              textColor: Colors.white,
              fontSize: 16.0);
        } else if (state is TripPlanErrorState) {
          print('Trip created falid');
          Fluttertoast.showToast(
              msg: "حاول مره اخرى  ",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Color.fromARGB(255, 218, 10, 10),
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
              ),
              title: const Text('Plan a trip')),
          body: Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _amman,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: _markers,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    height: 350,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // GooglePlaceAutoCompleteTextField for the starting point of the trip
                            GooglePlaceAutoCompleteTextField(
                              textEditingController: _startingPointController,
                              googleAPIKey:
                                  "AIzaSyBcWrxVAb6P_xbwlklNviUfBKTJskgnJCo",
                              inputDecoration: InputDecoration(
                                hintText: "Starting Point",
                              ),
                              itmClick: (prediction) => onPlaceSelected(
                                  prediction, _startingPointController),
                              getPlaceDetailWithLatLng:
                                  getPlaceDetailWithLatLng,
                            ),
                            GooglePlaceAutoCompleteTextField(
                              textEditingController: _stopPointController1,
                              googleAPIKey:
                                  "AIzaSyBcWrxVAb6P_xbwlklNviUfBKTJskgnJCo",
                              inputDecoration: InputDecoration(
                                hintText: "first Point",
                              ),
                              itmClick: (prediction) => onPlaceSelected(
                                  prediction, _stopPointController1),
                              getPlaceDetailWithLatLng:
                                  getPlaceDetailWithLatLng,
                            ),
                            // GooglePlaceAutoCompleteTextField for the ending point of the trip
                            GooglePlaceAutoCompleteTextField(
                              textEditingController: _stopPointController2,
                              googleAPIKey:
                                  "AIzaSyBcWrxVAb6P_xbwlklNviUfBKTJskgnJCo",
                              inputDecoration: InputDecoration(
                                hintText: "second Point",
                              ),
                              itmClick: (prediction) => onPlaceSelected(
                                  prediction, _stopPointController2),
                              getPlaceDetailWithLatLng:
                                  getPlaceDetailWithLatLng,
                            ),
                            GooglePlaceAutoCompleteTextField(
                              textEditingController: _stopPointController3,
                              googleAPIKey:
                                  "AIzaSyBcWrxVAb6P_xbwlklNviUfBKTJskgnJCo",
                              inputDecoration: InputDecoration(
                                hintText: "third Point",
                              ),
                              itmClick: (prediction) => onPlaceSelected(
                                  prediction, _stopPointController3),
                              getPlaceDetailWithLatLng:
                                  getPlaceDetailWithLatLng,
                            ),
                            // GooglePlaceAutoCompleteTextField for the ending point of the trip
                            GooglePlaceAutoCompleteTextField(
                              textEditingController: _stopPointController4,
                              googleAPIKey:
                                  "AIzaSyBcWrxVAb6P_xbwlklNviUfBKTJskgnJCo",
                              inputDecoration: InputDecoration(
                                hintText: "fourth Point",
                              ),
                              itmClick: (prediction) => onPlaceSelected(
                                  prediction, _stopPointController4),
                              getPlaceDetailWithLatLng:
                                  getPlaceDetailWithLatLng,
                            ),
                            // GooglePlaceAutoCompleteTextField for the ending point of the trip
                            GooglePlaceAutoCompleteTextField(
                              textEditingController: _endingPointController,
                              googleAPIKey:
                                  "AIzaSyBcWrxVAb6P_xbwlklNviUfBKTJskgnJCo",
                              inputDecoration: InputDecoration(
                                hintText: "ending Point",
                              ),
                              itmClick: (prediction) => onPlaceSelected(
                                  prediction, _endingPointController),
                              getPlaceDetailWithLatLng:
                                  getPlaceDetailWithLatLng,
                            ),

                            // TextFormField to display and select the date of the trip
                            TextFormField(
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
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: 365)),
                                );

                                if (selectedDate != null) {
                                  // Show time picker
                                  TimeOfDay? selectedTime =
                                      await showTimePicker(
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
                                        .format(DateTime.parse(
                                            tripTimeD.toString()))
                                        .toString()
                                    : '',
                              ),
                            ),
                            // TextFormField for the description of the trip
                            TextFormField(
                              controller: _descriptionController,
                              decoration: const InputDecoration(
                                  hintText: "Description"),
                            ),
                            // TextFormField for the seat number of the trip
                            TextFormField(
                              controller: _seatController,
                              decoration: const InputDecoration(
                                  hintText: "Seat Number"),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Seat Number cannot be empty';
                                }
                                return null;
                              },
                            ),
                            // TextFormField for the price tag of the trip
                            TextFormField(
                              controller: _priceController,
                              decoration:
                                  const InputDecoration(hintText: "Price Tag"),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Price Trip cannot be empty';
                                }
                                return null;
                              },
                            ),
                            // ElevatedButton to submit trip details
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: ConditionalBuilder(
                                    condition: state is! TripPlanLoadingState,
                                    builder: (context) => smallButton(
                                        text: 'Create Trip',
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            if (_startingPointController.text ==
                                                    '' &&
                                                _endingPointController.text ==
                                                    '') {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Starting,Ending Points cannot be empty",
                                                  toastLength:
                                                      Toast.LENGTH_LONG,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 5,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            } else {
                                              if (CacheHelper.getData(
                                                      key: 'carownerid') ==
                                                  '0') {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "يجب عليك تسجيل السيارة السائق اولاً",
                                                    toastLength:
                                                        Toast.LENGTH_LONG,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 5,
                                                    backgroundColor: Colors.red,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const RegisterCar()),
                                                );
                                              } else {
                                                TripsCubit.get(context).CreateTripPlan(
                                                    startpoint:
                                                        _startingPointController
                                                            .text,
                                                    endpoint:
                                                        _endingPointController
                                                            .text,
                                                    descreption:
                                                        _descriptionController
                                                            .text,
                                                    seatnumber: int.parse(
                                                        _seatController.text),
                                                    triptime: tripTimeD,
                                                    rideprice: int.parse(
                                                        _priceController.text),
                                                    sp1: _stopPointController1
                                                        .text,
                                                    sp2: _stopPointController2
                                                        .text,
                                                    sp3: _stopPointController3
                                                        .text,
                                                    sp4: _stopPointController4
                                                        .text,
                                                    trippassengergps: []);
                                              }
                                            }
                                          }
                                        }),
                                    fallback: (context) => const Center(
                                        child: CircularProgressIndicator()),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: smallButton(
                                    text: 'My Trips',
                                    onPressed: () {
                                      print(
                                          CacheHelper.getData(key: 'carownerid')
                                                  .toString() +
                                              'gggggggggg');

                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SearchCarOwnerTrips()),
                                        );
                                      });
                                      /*  Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SearchCarOwnerTrips()));*/
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
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
          ),
        );
      }),
    );
  }
}
