import 'package:bloc/bloc.dart';
import 'package:drive_share/layout/Log/cubit/states.dart';
import 'package:drive_share/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
