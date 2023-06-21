import 'package:drive_share/layout/trips/plan/tripPlan/planD/plan_trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../network/remote/cache_helper.dart';
import '../../../cubit/cubit.dart';
import '../../../cubit/states.dart';
import 'register_car_page.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key, void fun});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripsCubit()..CheckCarowner(),
      child: BlocConsumer<TripsCubit, TripState>(
        listener: (context, state) {
          /*  if (CacheHelper.getData(key: 'carownerid') != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PlanTrip()));
            if (CacheHelper.getData(key: 'carownerid')==null) {
              print(CacheHelper.getData(key: 'carownerid').toString() +
                  'ddddddddddddddddddddddddd');
            }
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterCar()));
          }*/
          if (state is TripPlanSuccessState) {
            print(CacheHelper.getData(key: 'carownerid').toString() +
                'gggggggggg');

            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const PlanTrip()),
              );
            });
          } else if (state is TripPlanErrorState) {
            print(CacheHelper.getData(key: 'carownerid'));
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const RegisterCar()),
              );
            });
          }
        },
        builder: (context, state) {
          var cubit = TripsCubit.get(context);

          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
