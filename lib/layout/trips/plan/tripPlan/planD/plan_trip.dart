import 'dart:async';
import 'dart:convert';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:drive_share/layout/RequestsPage.dart';
import 'package:drive_share/layout/trip_post.dart';
import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:drive_share/models/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:http/http.dart' as http;

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
    TextEditingController _checkPointController1 = TextEditingController();
  TextEditingController _checkPointController2 = TextEditingController();
    TextEditingController _checkPointController3 = TextEditingController();
  TextEditingController _checkPointController4 = TextEditingController();
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
  static final CameraPosition _amman = CameraPosition(
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
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(_selectedDate);
      });
  }

  // Function to display a TimePicker and update the selected time
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDate),
    );
    if (picked != null)
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TripsCubit(),
      child: BlocConsumer<TripsCubit, TripState>(listener: (context, state) {
        if (state is TripPlanSuccessState) {
          print('Trip created successfully');
        } else if (state is TripPlanErrorState) {
          print('Trip created falid');
        }
      }, builder: (context, state) {
        return Scaffold(
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
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.white,
                  child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // GooglePlaceAutoCompleteTextField for the starting point of the trip
                          GooglePlaceAutoCompleteTextField(
                            textEditingController: _startingPointController,
                            googleAPIKey:
                                "AIzaSyBcWrxVAb6P_xbwlklNviUfBKTJskgnJCo",
                            inputDecoration:
                                InputDecoration(hintText: "Starting Point"),
                            itmClick: (prediction) => onPlaceSelected(
                                prediction, _startingPointController),
                            getPlaceDetailWithLatLng: getPlaceDetailWithLatLng,
                          ),
                          GooglePlaceAutoCompleteTextField(
                            textEditingController: _checkPointController1,
                            googleAPIKey:
                                "AIzaSyBcWrxVAb6P_xbwlklNviUfBKTJskgnJCo",
                            inputDecoration:
                                InputDecoration(hintText: "First checkpoint"),
                            itmClick: (prediction) => onPlaceSelected(
                                prediction, _checkPointController1),
                            getPlaceDetailWithLatLng: getPlaceDetailWithLatLng,
                          ),
                          // GooglePlaceAutoCompleteTextField for the ending point of the trip
                          GooglePlaceAutoCompleteTextField(
                            textEditingController: _checkPointController2,
                            googleAPIKey:
                                "AIzaSyBcWrxVAb6P_xbwlklNviUfBKTJskgnJCo",
                            inputDecoration:
                                InputDecoration(hintText: "Second checkpoint"),
                            itmClick: (prediction) => onPlaceSelected(
                                prediction, _checkPointController2),
                            getPlaceDetailWithLatLng: getPlaceDetailWithLatLng,
                          ),
                          GooglePlaceAutoCompleteTextField(
                            textEditingController: _checkPointController3,
                            googleAPIKey:
                                "AIzaSyBcWrxVAb6P_xbwlklNviUfBKTJskgnJCo",
                            inputDecoration:
                                InputDecoration(hintText: "Third checkpoint"),
                            itmClick: (prediction) => onPlaceSelected(
                                prediction, _checkPointController3),
                            getPlaceDetailWithLatLng: getPlaceDetailWithLatLng,
                          ),
                          // GooglePlaceAutoCompleteTextField for the ending point of the trip
                          GooglePlaceAutoCompleteTextField(
                            textEditingController: _checkPointController4,
                            googleAPIKey:
                                "AIzaSyBcWrxVAb6P_xbwlklNviUfBKTJskgnJCo",
                            inputDecoration:
                                InputDecoration(hintText: "Fourth checkpoint"),
                            itmClick: (prediction) => onPlaceSelected(
                                prediction, _checkPointController4),
                            getPlaceDetailWithLatLng: getPlaceDetailWithLatLng,
                          ),
                          // GooglePlaceAutoCompleteTextField for the ending point of the trip
                          GooglePlaceAutoCompleteTextField(
                            textEditingController: _endingPointController,
                            googleAPIKey:
                                "AIzaSyBcWrxVAb6P_xbwlklNviUfBKTJskgnJCo",
                            inputDecoration:
                                InputDecoration(hintText: "Ending Point"),
                            itmClick: (prediction) => onPlaceSelected(
                                prediction, _endingPointController),
                            getPlaceDetailWithLatLng: getPlaceDetailWithLatLng,
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
                          // TextFormField for the description of the trip
                          TextFormField(
                            controller: _descriptionController,
                            decoration: InputDecoration(hintText: "Description"),
                          ),
                          // TextFormField for the seat number of the trip
                          TextFormField(
                            controller: _seatController,
                            decoration: InputDecoration(hintText: "Seat Number"),
                            keyboardType: TextInputType.number,
                          ),
                          // TextFormField for the price tag of the trip
                          TextFormField(
                            controller: _priceController,
                            decoration: InputDecoration(hintText: "Price Tag"),
                            keyboardType: TextInputType.number,
                          ),
                          // ElevatedButton to submit trip details
                           Row(
                             children: [
                               Expanded(
                                 child: ConditionalBuilder(
                                                       condition: state is! TripPlanLoadingState,
                                                       builder: (context) => largeButton(
                                    text: 'Create Trip',
                                    onPressed: () async {
                                                       //      if (formKey.currentState!.validate()) {
                                        TripsCubit.get(context).CreateTripPlan(
                                            startpoint: _startingPointController.text,
                                            endpoint: _endingPointController.text,
                                            descreption: _descriptionController.text,
                                            seatnumber:
                                                int.parse(_seatController.text),
                                            triptime: tripTimeD,
                                            rideprice:
                                                int.parse(_priceController.text),
                                            isactive: 1,
                                            carownerid: 2,
                                            sp1: 'ss',
                                            sp2: '',
                                            sp3: '',
                                            sp4: '',
                                            trippassengergps: []);
                                      }
                                    ),
                                                       fallback: (context) =>
                                    const Center(child: CircularProgressIndicator()),
                                                     ),
                               ),
                               SizedBox(width: 30,),
                                ElevatedButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const RequestsPage()));
                                }, child: const Text("my trip requests"), )
                             ],
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
