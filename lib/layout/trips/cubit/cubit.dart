import 'dart:convert';

import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:drive_share/models/Passenger.dart';
import 'package:drive_share/network/remote/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drive_share/models/trip.dart';

import '../../../models/RequestsPassenger.dart';
import '../../../network/remote/dio_helper.dart';
import '../tripCard-Cubit.dart';

class TripsCubit extends Cubit<TripState> {
  TripsCubit() : super(TripPlanInitialState());

  get jsonList => null;

  static TripsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.find_in_page), label: 'Find A Trip'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person_add_alt_rounded), label: 'Plan A Trip'),
  ];

  /* void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(PageBottomNav());
  }*/

  List<Widget> screens = [
    AllTripsCards(),
//TripCard(),
  ];

  List<dynamic> LiistTripsJson = [];
  List<TripGp> ListtTrips = [];

  List<dynamic> ListPassengerJson = [];
  List<PassengerGp> ListPassenger = [];

  void getAllListTrips() {
    emit(TripPlanLoadingState());
    DioHelper.getData(
            url:
                'https://driveshare.azurewebsites.net/api/Passenger/getalltrip')
        .then((value) => {
              //print(value.data.toString()),
              LiistTripsJson = value.data,
              // ListtTrips = json.decode(value.data.toString()),

              ListtTrips =
                  LiistTripsJson.map((data) => TripGp.fromJson(data)).toList(),

              print(ListtTrips[0].descreption),

              // print(LiistTripsCub[0]),
              emit(TripPlanSuccessState())
            })
        .catchError((onError) {
      print(onError.toString());
      emit(TripPlanErrorState(onError.toString()));
    });
  }

  void Searchbylocation({
    required String startpoint,
    required String endpoint,
  }) {
    emit(TripPlanLoadingState());
    DioHelper.postData(
            url:
                'https://driveshare.azurewebsites.net/api/Passenger/searchbylocation',
            data: {
          'startpoint': startpoint,
          'endpoint': endpoint,
        })
        .then((value) => {
              //print(value.data.toString()),
              LiistTripsJson = value.data,
              // ListtTrips = json.decode(value.data.toString()),

              ListtTrips =
                  LiistTripsJson.map((data) => TripGp.fromJson(data)).toList(),

              print(ListtTrips[0].descreption),

              // print(LiistTripsCub[0]),
              emit(TripPlanSuccessState())
            })
        .catchError((onError) {
      print(onError.toString());
      emit(TripPlanErrorState(onError.toString()));
    });
  }

/*




*/

  // Car Owner Controller
  List<TripGp> CarOwnerTrips = [];
  List<dynamic> CarOwnerTripsJson = [];

  List<dynamic> RequestsPassengerJson = [];
  List<RequestsPassenger> ListRequestsPassenger = [];

  void CarOwnerGetAllListTrips() {
    emit(TripPlanLoadingState());
    int id = int.parse(CacheHelper.getData(key: 'carownerid').toString());

    DioHelper.postData(
      url: 'https://driveshare.azurewebsites.net/api/CarOwner/gettripscarowner',
      data: {'carownerid': id},
    )
        .then((value) => {
              //print(value.data.toString()),
              CarOwnerTripsJson = value.data,
              CarOwnerTrips =
                  CarOwnerTripsJson.map((data) => TripGp.fromJson(data))
                      .toList(),

              print(CarOwnerTrips[0].descreption),

              emit(TripPlanSuccessState())
            })
        .catchError((onError) {
      print(onError.toString());
      emit(TripPlanErrorState(onError.toString()));
    });
  }

  void CarRegister({
    // required int passengerid,
    required String cartype,
    required int carYearmodel,
    required String carmmodel,
    required String carnumber,
    // required String imageliecnse,
    // required String drivelicense,
  }) {
    emit(TripPlanLoadingState());
    print(CacheHelper.getData(key: 'Passengerid'));
    int id = int.parse(CacheHelper.getData(key: 'Passengerid').toString());
    print(id);
    DioHelper.postData(
            url:
                'https://driveshare.azurewebsites.net/api/CarOwner/activecarowner',
            data: {
          'passengerid': id,
          'Cartype': cartype,
          'Carmodel': carYearmodel,
          'Carmmodel': carmmodel,
          'Carnumber': carnumber,
          'Imageliecnse': 'imageliecnse',
          'Drivelicense': 'zz',
        })
        .then((value) => {
//print(value.data.toString()),
              print(value.statusCode),
              emit(TripPlanSuccessState()),
            })
        .catchError((onError) {
      print(onError.toString());
      emit(TripPlanErrorState(onError.toString()));
    });
  }

  void CreateTripPlan({
    required String startpoint,
    required String endpoint,
    required String descreption,
    required int seatnumber,
    required DateTime triptime,
    required int rideprice,
    required String sp1,
    required String sp2,
    required String sp3,
    required String sp4,
    // required String carowner,
    required List<dynamic> trippassengergps,
  }) {
    emit(TripPlanLoadingState());
    int CarOwnerId =
        int.parse(CacheHelper.getData(key: 'carownerid').toString());

    DioHelper.postData(
            url: 'https://driveshare.azurewebsites.net/api/CarOwner/createtrip',
            data: {
          'startpoint': startpoint,
          'endpoint': endpoint,
          'rideprice': rideprice,
          'triptime': triptime.toIso8601String(),
          'seatnumber': seatnumber,
          'descreption': descreption,
          'isactive': 0,
          'carownerid': CarOwnerId,
          'sp1': sp1,
          'sp2': sp2,
          'sp3': sp3,
          'sp4': sp4,
          'carowner': null,
          'trippassengergps': trippassengergps
        })
        .then((value) => {
//print(value.data.toString()),
              print('**********iiosmd'),
              emit(TripPlanSuccessState()),
            })
        .catchError((onError) {
      print(onError.toString());
      emit(TripPlanErrorState(onError.toString()));
    });
  }

  void AcceptPassenger({
    required int tripid,
    required int passngerid,
  }) {
    emit(CarOwnerTripsLoadingState());
    DioHelper.postData(
            url:
                'https://driveshare.azurewebsites.net/api/CarOwner/acceptpassenger',
            data: {
          'tripid': tripid,
          'passengerid': passngerid,
        })
        .then((value) => {
              //ListPassengerJson = value.data,

              print('aaaaaaaaaaa'),
              emit(CarOwnerTripsSuccessState())
            })
        .catchError((onError) {
      print(onError.toString());
      emit(CarOwnerTripsErrorState(onError.toString()));
    });
  }

  void GetAllRequest({
    required int tripid,
  }) {
    emit(TripPlanLoadingState());
    DioHelper.postData(
            url:
                'https://driveshare.azurewebsites.net/api/CarOwner/gettallrequest',
            data: {'tripid': tripid})
        .then((value) => {
              //ListPassengerJson = value.data,
              RequestsPassengerJson = value.data,
              ListRequestsPassenger = RequestsPassengerJson.map(
                  (data) => RequestsPassenger.fromJson(data)).toList(),

//print(ListPassenger[0].fname),

              print(value.data),
              emit(TripPlanSuccessState())
            })
        .catchError((onError) {
      print(onError.toString());
      emit(TripPlanErrorState(onError.toString()));
    });
  }

  void GetAllAccept({
    required int tripid,
  }) {
    emit(TripPlanLoadingState());
    print(tripid.toString() + ' 999999gggggggggg ');
    DioHelper.postData(
            url:
                'https://driveshare.azurewebsites.net/api/CarOwner/gettallaccept',
            data: {'tripid': tripid})
        .then((value) => {
              //ListPassengerJson = value.data,
              RequestsPassengerJson = value.data,
              ListRequestsPassenger = RequestsPassengerJson.map(
                  (data) => RequestsPassenger.fromJson(data)).toList(),

//print(ListPassenger[0].fname),

              print(value.data),

              emit(TripPlanSuccessState())
            })
        .catchError((error) {
      print(error.toString());
      print(error.response?.data);
      emit(TripPlanErrorState(error.toString()));
    });
  }

  void ActiveTrip({
    required int tripid,
  }) {
    emit(TripPlanLoadingState());
    DioHelper.putData(
            url: 'https://driveshare.azurewebsites.net/api/CarOwner/activetrip',
            data: {'tripid': tripid})
        .then((value) => {
              //ListPassengerJson = value.data,

              print('ActiveTrip'),

              // print(LiistTripsCub[0]),
              emit(TripPlanSuccessState())
            })
        .catchError((onError) {
      print(onError.toString());
      emit(TripPlanErrorState(onError.toString()));
    });
  }

  PassengerGp passengerById = PassengerGp(
      fname: '', lname: '', phonenumber: '', username: '', imagefile: '');
  void GetPassengerById() {
    emit(TripPlanLoadingState());
//int id = int.parse(CacheHelper.getData(key: 'Passengerid').toString());
    DioHelper.postData(
      url: 'https://driveshare.azurewebsites.net/api/CarOwner/getpassengerbyid',
      data: {'passengerid': 142},
    ).then((value) async {
      //passengerById = value.data.map((data) => PassengerGp.fromJson(data));

      final json = value.data as Map<String, dynamic>;
      passengerById = PassengerGp.fromJson(json);

      emit(TripPlanSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(TripPlanErrorState(error.toString()));
    });
  }

  void CheckCarowner() {
    emit(TripPlanLoadingState());
    int id = int.parse(CacheHelper.getData(key: 'Passengerid').toString());
    DioHelper.postData(
      url: 'https://driveshare.azurewebsites.net/api/CarOwner/checkcarowner',
      data: {'passengerid': id},
    ).then((value) async {
      //passengerById = value.data.map((data) => PassengerGp.fromJson(data));

      print(value.data);
      final jsonData = json.decode(value.data) as Map<String, dynamic>;
      print(jsonData['carownerid']);

      if (jsonData['carownerid'] != null) {
        CacheHelper.saveData(key: 'carownerid', value: jsonData['carownerid']);
      }
      print(CacheHelper.getData(key: 'carownerid').toString() + '999999');

/* if (jsonData['carownerid'] == 0) {
              emit(TripPlanErrorState('CarownerId = 0 '));

      }*/

      emit(TripPlanSuccessState());
    }).catchError((error) {
      print('CarownerId = 0 ');
      emit(TripPlanErrorState(error.toString()));
    });
  }
}
