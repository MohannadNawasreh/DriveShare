import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/trip.dart';
/*
Future<List<TripGp>> fetchTripData() async {
var request = http.Request('GET', Uri.parse('https://driveshare.azurewebsites.net/api/Passenger/getalltrip'));


http.StreamedResponse response = await request.send();  
  if (response.statusCode == 200) {
 // print(await response.stream.bytesToString());
   final List<dynamic> jsonResponse = await jsonDecode(response.stream.toString());
    
    return await jsonResponse.map((data) => TripGp.fromJson(data)).toList();
}
else {
    throw Exception('Failed to load trip data');
}
   
  }*/

Future<List<TripGp>> fetchTrips() async {
  final response = await http.get(Uri.parse(
      'https://driveshare.azurewebsites.net/api/Passenger/getalltrip'));

  if (response.statusCode == 200) {
    print(response.body.toString());
    final List<dynamic> jsonList = json.decode(response.body);

    return jsonList.map((data) => TripGp.fromJson(data)).toList();
  } else {
    throw Exception('Failed to fetch trips');
  }
}

Future<bool> createTrip(TripGp t) async {
  final url =
      Uri.parse('https://driveshare.azurewebsites.net/api/CarOwner/createtrip');

  final tripData = {
    "startpoint": t.startpoint,
    "endpoint": t.endpoint,
    "rideprice": t.rideprice,
    "triptime": t.triptime,
    "seatnumber": t.seatnumber,
    "descreption": t.descreption,
    "isactive": t.isactive,
    "carownerid": t.carownerid,
    "sp1": t.sp1,
    "sp2": t.sp2,
    "sp3": t.sp3,
    "sp4": t.sp4,
    "carowner": t.carowner,
    "trippassengergps": t.trippassengergps
  };

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(tripData),
    );

    if (response.statusCode == 200) {
      // Trip creation successful
      print('Trip created successfully');
      return true;
    } else {
      // Trip creation failed
      print('Failed to create trip. Status code: ${response.statusCode}');
      return false;
    }
  } catch (error) {
    // Error occurred during the API call
    print('Error creating trip: $error');
    return false;
  }
}
