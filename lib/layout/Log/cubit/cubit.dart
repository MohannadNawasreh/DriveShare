import 'dart:convert';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:drive_share/layout/Log/cubit/states.dart';
import 'package:drive_share/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/TokenModel.dart';
import '../../../network/remote/cache_helper.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

      String TokenLogin ='';


  void PassengerLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.PostDioLogin(
            url: 'https://driveshare.azurewebsites.net/api/User/login',
            data: {
          'email': email,
          'password': password,
        })
        .then((value) => {
              TokenLogin = value.data,

              print(value.data.toString()),
              emit(LoginSuccessState()),
                
            })
        .catchError((onError) {
      print(onError.toString());
      emit(LoginErrorState(onError));
    });
  }
}


/********************************* */

class DSLoginCubit extends Cubit<DSLoginState> {
  DSLoginCubit() : super(DSLoginIntialState());

  static DSLoginCubit get(context) => BlocProvider.of(context);
  late TokenModel T;

  void userLogin({required String email, required String password}) {
    emit(DSLoginLoadingState());
    DioHelper.postData(
      url: 'https://driveshare.azurewebsites.net/api/User/login',
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      final responseJson = value.data;
      if (responseJson is String) {
        final json = jsonDecode(responseJson) as Map<String, dynamic>;
        T = TokenModel.fromJson(json);
        print(T.token);
        Map<String, dynamic> decodedToken = JwtDecoder.decode(T.token);
        print(decodedToken);
        if (decodedToken != null && decodedToken.containsKey('claims')) {
        Map<String, dynamic> claims = decodedToken['claims'];
        CacheHelper.saveData(key: 'Passengerid', value: claims['Passengerid']);
        CacheHelper.saveData(key: 'carownerid', value: claims['carownerid']);
        print(claims['carownerid']);
        } else {
        emit(DSLoginErrorState('Invalid token format'));
        } 
        emit(DSLoginSuccessState(T));
        print("1");
      } else {
        emit(DSLoginErrorState('Invalid response format'));
      }
    }).catchError((error) {
      print(error.toString());
      emit(DSLoginErrorState(error.toString()));
    });
  }
}