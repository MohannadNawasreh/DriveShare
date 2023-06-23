import 'dart:convert';
import 'package:drive_share/layout/trips/Find/SearchALLTrips/tripCard-Cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:drive_share/models/Car.dart';
import 'package:drive_share/models/Passenger.dart';
import 'package:drive_share/models/myTrips.dart';
import 'package:drive_share/network/remote/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drive_share/models/trip.dart';
import '../../../models/RequestsPassenger.dart';
import '../../../network/remote/dio_helper.dart';

class TripsCubit extends Cubit<TripState> {
  TripsCubit() : super(TripsInitialState());

  get jsonList => null;

  static TripsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.find_in_page), label: 'Find A Trip'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person_add_alt_rounded), label: 'Plan A Trip'),
  ];

//--------------------------------------------------- Car Owner Controller------------------------------------------------------------------------------------
  List<TripGp> CarOwnerTrips = [];
  List<dynamic> CarOwnerTripsJson = [];

  List<dynamic> RequestsPassengerJson = [];
  List<RequestsPassenger> ListRequestsPassenger = [];

  void CarOwnerGetAllListTrips() {
    emit(TripPlanLoadingState());
    int id = int.parse(CacheHelper.getData(key: 'carownerid').toString());
    print(id.toString() + 'sssssss');
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
              print(CacheHelper.getData(key: 'carownerid').toString() +
                  'gggggggggg'),

              print(value.statusCode),
              emit(TripPlanSuccessState()),
            })
        .catchError((onError) {
      print(onError.toString());
      emit(TripPlanErrorState(onError.toString()));
    });
  }

  void UpdateCar({
    // required int passengerid,
    required String cartype,
    required int carYearmodel,
    required String carmmodel,
    required String carnumber,
    //required String imageliecnse,
    // required String drivelicense,
  }) {
    emit(TripPlanLoadingState());
    print(CacheHelper.getData(key: 'Passengerid'));
    int id = int.parse(CacheHelper.getData(key: 'Passengerid').toString());
    print(id);
    DioHelper.putData(
            url: 'https://driveshare.azurewebsites.net/api/CarOwner/updatecar',
            data: {
          'passengerid': id,
          'Cartype': cartype,
          'Carmodel': carYearmodel,
          'Carmmodel': carmmodel,
          'Carnumber': carnumber,
          'Imageliecnse': 'ii',
          'Drivelicense': 'dd',
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

  void DeleteCar() {
    emit(DeleteUserLoadingState());
    int id = int.parse(CacheHelper.getData(key: 'Passengerid').toString());
    DioHelper.deleteData(
      url: 'https://driveshare.azurewebsites.net/api/CarOwner/deletecar',
      data: {'passengerid': id},
    ).then((value) async {
      print(value.statusCode);

      emit(DeleteUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(DeleteUserErrorState(error.toString()));
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

  void UpdateTrip({
    required int tripid,
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
  }) {
    emit(TripPlanLoadingState());
    int CarOwnerId =
        int.parse(CacheHelper.getData(key: 'carownerid').toString());

    DioHelper.putData(
            url: 'https://driveshare.azurewebsites.net/api/CarOwner/updatetrip',
            data: {
          'tripid': tripid,
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

  void FinishTrip({
    required int tripid,
  }) {
    emit(TripPlanLoadingState());
    DioHelper.putData(
            url: 'https://driveshare.azurewebsites.net/api/CarOwner/finishtrip',
            data: {'tripid': tripid})
        .then((value) => {
              //ListPassengerJson = value.data,

              print('FinishTrip'),

              // print(LiistTripsCub[0]),
              emit(TripPlanSuccessState())
            })
        .catchError((onError) {
      print(onError.toString());
      emit(TripPlanErrorState(onError.toString()));
    });
  }

  PassengerGp UserInfo = PassengerGp();

  void GetPassengerById() {
    emit(UserInfoLoadingState());
    int id = int.parse(CacheHelper.getData(key: 'Passengerid').toString());
    DioHelper.postData(
      url: 'https://driveshare.azurewebsites.net/api/CarOwner/getpassengerbyid',
      data: {'passengerid': id},
    ).then((value) async {
      //passengerById = value.data.map((data) => PassengerGp.fromJson(data));

      print(value.data);
      final json = value.data as Map<String, dynamic>;
      UserInfo = PassengerGp.fromJson(json);
      print(UserInfo.phonenumber);

      emit(UserInfoSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(UserInfoErrorState(error.toString()));
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
      print(jsonData['carownerid'].toString() + 'rrrrrrrrrrrrrrr');

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

  PassengerGp CarOwnerInfo = PassengerGp();
  void GetCarownerInfo({
    required int carownerid,
  }) {
    emit(UserInfoLoadingState());
    int id = int.parse(CacheHelper.getData(key: 'carownerid').toString());
    DioHelper.postData(
      url: 'https://driveshare.azurewebsites.net/api/CarOwner/getcarowner',
      data: {'carownerid': carownerid},
    ).then((value) async {
      //passengerById = value.data.map((data) => PassengerGp.fromJson(data));

      print(value.data);
      final json = value.data as Map<String, dynamic>;
      CarOwnerInfo = PassengerGp.fromJson(json);
      print(CarOwnerInfo.fname);

      emit(UserInfoSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(UserInfoErrorState(error.toString()));
    });
  }

  CarGp car = CarGp();
  void GetCarInfo() {
    emit(UserInfoLoadingState());
    int id = int.parse(CacheHelper.getData(key: 'carownerid').toString());
    DioHelper.postData(
      url: 'https://driveshare.azurewebsites.net/api/CarOwner/getcar',
      data: {'carownerid': id},
    ).then((value) async {
      //passengerById = value.data.map((data) => PassengerGp.fromJson(data));

      print(value.data);
      final json = value.data as Map<String, dynamic>;
      car = CarGp.fromJson(json);

      print(car.carmmodel);

      emit(UserInfoSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(UserInfoErrorState(error.toString()));
    });
  }

  void DeleteTrip({
    required int tripid,
  }) {
    emit(TripPlanLoadingState());
    DioHelper.deleteData(
      url: 'https://driveshare.azurewebsites.net/api/CarOwner/deletetrip',
      data: {'tripid': tripid},
    ).then((response) {
      print('DeleteTrip');
      print(response.statusCode);
      // Handle the response as needed
      emit(TripPlanSuccessState());
    }).catchError((error) {
      print('Error: $error');
      print('object');
      emit(TripPlanErrorState(error.toString()));
    });
  }

//-------------------------------------------Passenger-------------------------------------------------------------------------------
//-------------------------------------------Passenger-------------------------------------------------------------------------------
//-------------------------------------------Passenger-------------------------------------------------------------------------------
//-------------------------------------------Passenger-------------------------------------------------------------------------------

  void RequestTrip({required int tripid, required int passengerid}) {
    emit(RequestLoadingState());
    DioHelper.postData(
            url:
                'https://driveshare.azurewebsites.net/api/Passenger/requesttrip',
            data: {'tripid': tripid, 'passengerid': passengerid})
        .then((value) => {
              print('aaaaaaaaaaa'),
              print(value.statusCode),
              emit(RequestSuccessState()),
            })
        .catchError((onError) {
      print(onError.toString());
      emit(RequestErrorState(onError.toString()));
    });
  }

  List<MyRide> TripSeaechList = [];
  List<dynamic> TripSeaechJson = [];

  void getAllListTrips() {
    emit(TripPlanLoadingState());
    DioHelper.getData(
            url:
                'https://driveshare.azurewebsites.net/api/Passenger/getalltrip')
        .then((value) => {
              //print(value.data.toString()),
              TripSeaechJson = value.data,
              // ListtTrips = json.decode(value.data.toString()),
              print(value.data),

              TripSeaechList =
                  TripSeaechJson.map((data) => MyRide.fromJson(data)).toList(),

              print(TripSeaechList[0].descreption),

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
              TripSeaechJson = value.data,
              // ListtTrips = json.decode(value.data.toString()),

              TripSeaechList =
                  TripSeaechJson.map((data) => MyRide.fromJson(data)).toList(),

              print(TripSeaechList[0].descreption),

              // print(LiistTripsCub[0]),
              emit(TripPlanSuccessState())
            })
        .catchError((onError) {
      print(onError.toString());
      emit(TripPlanErrorState(onError.toString()));
    });
  }

  List<MyRide> myRide = [];
  List<dynamic> myRideJson = [];
  void MyTrip() {
    emit(UserInfoLoadingState());
    int id = int.parse(CacheHelper.getData(key: 'Passengerid').toString());
    DioHelper.postData(
      url: 'https://driveshare.azurewebsites.net/api/Passenger/mytrip',
      data: {'passengerid': id},
    ).then((value) async {
      //passengerById = value.data.map((data) => PassengerGp.fromJson(data));

      print(value.data);

      myRideJson = value.data;
      myRide = myRideJson.map((data) => MyRide.fromJson(data)).toList();

      // print(myRide[0].endpoint);

      emit(UserInfoSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(UserInfoErrorState(error.toString()));
    });
  }

  void PassengerActiveTrip({
    required int tripid,
  }) {
    emit(UserInfoLoadingState());
    int id = int.parse(CacheHelper.getData(key: 'Passengerid').toString());

    DioHelper.postData(
            url: 'https://driveshare.azurewebsites.net/api/Passenger/isstart',
            data: {'passengerid': 186, 'tripid': tripid})
        .then((value) => {
              //ListPassengerJson = value.data,

              print(value.statusCode),

              // print(LiistTripsCub[0]),
              emit(UserInfoSuccessState())
            })
        .catchError((onError) {
      print(onError.toString());
      emit(UserInfoErrorState(onError.toString()));
    });
  }

  void PassengerFinishTrip({
    required int tripid,
  }) {
    emit(TripPlanLoadingState());
    int id = int.parse(CacheHelper.getData(key: 'Passengerid').toString());

    DioHelper.postData(
            url: 'https://driveshare.azurewebsites.net/api/Passenger/isfinish',
            data: {'passengerid': id, 'tripid': tripid})
        .then((value) => {
              //ListPassengerJson = value.data,

              print('FinishTrip'),

              // print(LiistTripsCub[0]),
              emit(TripPlanSuccessState())
            })
        .catchError((onError) {
      print(onError.toString());
      emit(TripPlanErrorState(onError.toString()));
    });
  }

//-------------------------------------------------------User----------------------------------------------------------

  void UpdateUser({
    required String phoneNumber,
    required String email,
    required String userName,
    required String fName,
    required String lName,
    required String imageFile,
  }) {
    emit(UpdateUserLoadingState());
    int id = int.parse(CacheHelper.getData(key: 'Passengerid').toString());

    DioHelper.putData(
            url: 'https://driveshare.azurewebsites.net/api/User/updateuser',
            data: {
          'passengerid': id,
          'fname': fName,
          'lname': lName,
          'phonenumber': phoneNumber,
          'username': email,
          'IMAGEFILE': imageFile,
          'email': userName,
          'password': ""
        })
        .then((value) => {
              //ListPassengerJson = value.data,

              print('UpdateUser'),

              // print(LiistTripsCub[0]),
              emit(UpdateUserSuccessState())
            })
        .catchError((onError) {
      print(onError.toString());
      emit(UpdateUserErrorState(onError.toString()));
    });
  }

  void DeleteUser() {
    emit(DeleteUserLoadingState());
    int id = int.parse(CacheHelper.getData(key: 'Passengerid').toString());
    DioHelper.deleteData(
      url: 'https://driveshare.azurewebsites.net/api/User/deleteuser',
      data: {'passengerid': 158},
    ).then((value) async {
      print(value.statusCode);

      emit(DeleteUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(DeleteUserErrorState(error.toString()));
    });
  }
}
