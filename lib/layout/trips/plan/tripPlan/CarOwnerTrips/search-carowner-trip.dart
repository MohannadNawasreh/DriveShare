import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:drive_share/layout/trips/plan/tripPlan/CarOwnerTrips/carowner-trips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCarOwnerTrips extends StatelessWidget {
  const SearchCarOwnerTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripsCubit()..CarOwnerGetAllListTrips()..GetPassengerById(),
      child: BlocConsumer<TripsCubit, TripState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TripsCubit.get(context);
          return const Scaffold(
            /*      appBar: AppBar(
              title: const Text('Test Trip'),
            ),
        */
            body: CarOwnerTrips(),
            /*    bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (value) {
                  cubit.changeBottomNavBar(value);
                },
                items: cubit.bottomItems),*/
          );
        },
      ),
    );
  }
}
