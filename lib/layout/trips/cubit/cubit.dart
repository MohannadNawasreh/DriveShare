import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:drive_share/models/Passenger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drive_share/models/trip.dart';

import '../../../network/remote/dio_helper.dart';
import '../t1.dart';

class TripsCubit extends Cubit<TripState> {
  TripsCubit() : super(PageeInitial());

  get jsonList => null;

  static TripsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.find_in_page), label: 'Find A Trip'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person_add_alt_rounded), label: 'Plan A Trip'),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(PageBottomNav());
  }

  List<Widget> screens = [
    TTripC(),
//TripCard(),
  ];

  List<dynamic> LiistTripsCub = [];
  List<TripGp> ListtTrips = [];

  List<dynamic> ListPassengerJson = [];
  List<PassengerGp> ListPassenger = [];

  void getAllListTrips() {
    emit(TripLoadingState());
    DioHelper.getData(
            url:
                'https://driveshare.azurewebsites.net/api/Passenger/getalltrip')
        .then((value) => {
              //print(value.data.toString()),
              LiistTripsCub = value.data,
              // ListtTrips = json.decode(value.data.toString()),

              ListtTrips =
                  LiistTripsCub.map((data) => TripGp.fromJson(data)).toList(),

              print(ListtTrips[0].descreption),

              // print(LiistTripsCub[0]),
              emit(TripGetSuccessState())
            })
        .catchError((onError) {
      print(onError.toString());
      emit(TripGetErrorState(onError.toString()));
    });
  }

  void CreateTripPlan({
    required String startpoint,
    required String endpoint,
    required String descreption,
    required int seatnumber,
    required DateTime triptime,
    required int rideprice,
    required int isactive,
    required int carownerid,
    required String sp1,
    required String sp2,
    required String sp3,
    required String sp4,
    // required String carowner,
    required List<dynamic> trippassengergps,
  }) {
    emit(TripPlanLoadingState());
    DioHelper.PostPlanTrip(
            url: 'https://driveshare.azurewebsites.net/api/CarOwner/createtrip',
            data: {
          'startpoint': startpoint,
          'endpoint': endpoint,
          'rideprice': rideprice,
          'triptime': triptime.toIso8601String(),
          'seatnumber': seatnumber,
          'descreption': descreption,
          'isactive': 1,
          'carownerid': 81,
          'sp1': sp1,
          'sp2': '',
          'sp3': '',
          'sp4': '',
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

  void CarRegister({
    // required int passengerid,
    required String cartype,
    required int carYearmodel,
    required String carmmodel,
    required String carnumber,
    // required String imageliecnse,
    // required String drivelicense,
  }) {
    emit(CarLoadingState());
    DioHelper.PostCarRegister(
            url:
                'https://driveshare.azurewebsites.net/api/CarOwner/activecarowner',
            data: {
          'passengerid': 119,
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
              emit(CarSuccessState()),
            })
        .catchError((onError) {
      print(onError.toString());
      emit(CarErrorState(onError.toString()));
    });
  }

  void Searchbylocation({
    required String startpoint,
    required String endpoint,
  }) {
    emit(TripLoadingState());
    DioHelper.postData(
            url:
                'https://driveshare.azurewebsites.net/api/Passenger/searchbylocation',
            data: {
          'startpoint': startpoint,
          'endpoint': endpoint,
        })
        .then((value) => {
              //print(value.data.toString()),
              LiistTripsCub = value.data,
              // ListtTrips = json.decode(value.data.toString()),

              ListtTrips =
                  LiistTripsCub.map((data) => TripGp.fromJson(data)).toList(),

              print(ListtTrips[0].descreption),

              // print(LiistTripsCub[0]),
              emit(TripGetSuccessState())
            })
        .catchError((onError) {
      print(onError.toString());
      emit(TripGetErrorState(onError.toString()));
    });
  }

  void GetAllRequest({
    required String tripid,
  }) {
    emit(TripLoadingState());
    DioHelper.postData(
            url:
                'https://driveshare.azurewebsites.net/api/CarOwner/gettallrequest',
            data: {'tripid': tripid})
        .then((value) => {
              //ListPassengerJson = value.data,

              ListPassenger =
                  value.data.map((data) => PassengerGp.fromJson(data)).toList(),

              print(ListPassenger[0].fname),

              // print(LiistTripsCub[0]),
              emit(TripGetSuccessState())
            })
        .catchError((onError) {
      print(onError.toString());
      emit(TripGetErrorState(onError.toString()));
    });
  }

     void AcceptPassenger({
    required String tripid,
  }) {
    emit(TripLoadingState());
    DioHelper.postData(
            url:
                'https://driveshare.azurewebsites.net/api/CarOwner/acceptpassenger',
            data: {'tripid': tripid})
        .then((value) => {
              //ListPassengerJson = value.data,

              ListPassenger =
                  value.data.map((data) => PassengerGp.fromJson(data)).toList(),

              print(ListtTrips[0].descreption),

              // print(LiistTripsCub[0]),
              emit(TripGetSuccessState())
            })
        .catchError((onError) {
      print(onError.toString());
      emit(TripGetErrorState(onError.toString()));
    });
  } void GetAllAccept({
    required String tripid,
  }) {
    emit(TripLoadingState());
    DioHelper.postData(
            url:
                'https://driveshare.azurewebsites.net/api/CarOwner/gettallaccept',
            data: {'tripid': tripid})
        .then((value) => {
              //ListPassengerJson = value.data,

            
              print('acceptpassenger'),

              // print(LiistTripsCub[0]),
              emit(TripGetSuccessState())
            })
        .catchError((onError) {
      print(onError.toString());
      emit(TripGetErrorState(onError.toString()));
    });
  }



}
