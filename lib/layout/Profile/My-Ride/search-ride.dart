import 'package:drive_share/layout/Profile/My-Ride/my-ride.dart';
import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchMyRide extends StatelessWidget {
  SearchMyRide({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripsCubit()..MyTrip(),
      child: BlocConsumer<TripsCubit, TripState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TripsCubit.get(context);
          return const Scaffold(
            body: MyRidee(),
          );
        },
      ),
    );
  }
}
