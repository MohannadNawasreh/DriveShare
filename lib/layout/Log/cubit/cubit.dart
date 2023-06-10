import 'dart:convert';
import 'package:drive_share/layout/Log/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../../models/TokenModel.dart';
import '../../../network/remote/cache_helper.dart';
import '../../../network/remote/dio_helper.dart';

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
    ).then((value) async {
      final responseJson = value.data;
      if (responseJson is String) {
        final json = jsonDecode(responseJson) as Map<String, dynamic>;
        T = TokenModel.fromJson(json);
        print(T.token);
        if (T.token == '0') {
          print('token = 0 ');
          emit(DSLoginErrorState('Invalid Email or Password'));
        } else {
          Map<String, dynamic> decodedToken = JwtDecoder.decode(T.token);
          print(decodedToken.toString() + '555555555555555');

          print(decodedToken['Passengerid']);
          print(decodedToken['carownerid']);

          if (decodedToken['Passengerid'] != null) {
            CacheHelper.saveData(
                key: 'Passengerid', value: decodedToken['Passengerid']);
          }
          print(await CacheHelper.getData(key: 'Passengerid').toString() +
              '  Eyass');

          if (decodedToken['carownerid'] != null) {
            CacheHelper.saveData(
                key: 'carownerid', value: decodedToken['carownerid']);
          }
        }
        print(await CacheHelper.getData(key: 'carownerid').toString() +
            '  eyass');

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
