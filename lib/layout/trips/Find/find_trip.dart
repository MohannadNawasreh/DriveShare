import 'dart:async';
import 'dart:convert';
import 'package:drive_share/layout/trips/Find/SearchALLTrips/search_trip.dart';
import 'package:drive_share/http/trip_post.dart';
import 'package:drive_share/models/components/components.dart';
import 'package:flutter/material.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:intl/intl.dart';
import '../../../models/trip.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:http/http.dart' as http;

import 'SearchSpEp/search-sp-ep.dart';

class FindTrip extends StatefulWidget {
  const FindTrip({Key? key}) : super(key: key);

  @override
  _FindTripState createState() => _FindTripState();
}

class _FindTripState extends State<FindTrip> {
  // A Completer to hold a reference to the GoogleMapController
  Completer<GoogleMapController> _controller = Completer();
  // TextEditingControllers for the starting and ending points of the trip
  TextEditingController _startingPointController = TextEditingController();
  TextEditingController _endingPointController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
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
        _selectedDate = DateTime(_selectedDate.year, _selectedDate.month,
            _selectedDate.day, picked.hour, picked.minute);
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
            final position = LatLng(detail["geometry"]["location"]["lat"],
                detail["geometry"]["location"]["lng"]);
            setState(() {
              // Add a Marker to the map at the selected location
              _markers.add(Marker(
                markerId: MarkerId(prediction.placeId!),
                position: position,
              ));
            });
            // Move the map camera to the selected location
            final GoogleMapController mapController = await _controller.future;
            mapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: position, zoom: 15),
            ));
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
            final position = LatLng(detail["geometry"]["location"]["lat"],
                detail["geometry"]["location"]["lng"]);
            setState(() {
              _markers.add(Marker(
                markerId: MarkerId(prediction.placeId!),
                position: position,
              ));
            });
            final GoogleMapController mapController = await _controller.future;
            mapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: position, zoom: 15),
            ));
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  // GooglePlaceAutoCompleteTextField for the starting point of the trip
                  GooglePlaceAutoCompleteTextField(
                    textEditingController: _startingPointController,
                    googleAPIKey: "AIzaSyBcWrxVAb6P_xbwlklNviUfBKTJskgnJCo",
                    inputDecoration:
                        InputDecoration(hintText: "Starting Point"),
                    itmClick: (prediction) =>
                        onPlaceSelected(prediction, _startingPointController),
                    getPlaceDetailWithLatLng: getPlaceDetailWithLatLng,
                  ),
                  //GooglePlaceAutoCompleteTextField for the ending point of the trip
                  GooglePlaceAutoCompleteTextField(
                    textEditingController: _endingPointController,
                    googleAPIKey: "AIzaSyBcWrxVAb6P_xbwlklNviUfBKTJskgnJCo",
                    inputDecoration: InputDecoration(hintText: "Ending Point"),
                    itmClick: (prediction) =>
                        onPlaceSelected(prediction, _endingPointController),
                    getPlaceDetailWithLatLng: getPlaceDetailWithLatLng,
                  ),
                  //TextFormField to display and select the date of the trip
                  TextFormField(
                    controller: _dateController,
                    decoration:
                        InputDecoration(icon: Icon(Icons.calendar_today)),
                    onTap: () => _selectDate(context),
                  ),
                  // TextFormField to display and select the time of the trip
                  TextFormField(
                    controller: _timeController,
                    decoration: InputDecoration(icon: Icon(Icons.access_time)),
                    onTap: () => _selectTime(context),
                  ),
                  SizedBox(height: 20),
                  // ElevatedButton to submit trip details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllTripsPassenger()));
                          // Submit trip details
                        },
                        child: Text("All Trips",
                            style: TextStyle(fontSize: 12)),
                      ),


                      
                      SizedBox(width: 30),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchBySpEpTrip(
                                        startP: _startingPointController.text,
                                        endP: _endingPointController.text,
                                      )));
                          // Submit trip details
                        },
                        child:
                            Text("Search", style: TextStyle(fontSize: 12)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
