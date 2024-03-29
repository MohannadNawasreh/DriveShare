import 'package:drive_share/layout/Profile/edit/edit_profile.dart';
import 'package:drive_share/layout/Profile/profile.dart';
import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:drive_share/layout/Profile/car/car_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCar extends StatelessWidget {
  SearchCar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripsCubit()..GetCarInfo(),
      child: BlocConsumer<TripsCubit, TripState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TripsCubit.get(context);
          return const Scaffold(
            body: CarDetails(),
          );
        },
      ),
    );
  }
}
