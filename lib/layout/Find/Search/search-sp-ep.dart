import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'all-trip.dart';


class SearchBySpEpTrip extends StatelessWidget {
  final String startP;
    final String endP;


  const SearchBySpEpTrip({super.key, required this.startP, required this.endP,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripsCubit()..Searchbylocation(startpoint: startP, endpoint: endP),
      child: BlocConsumer<TripsCubit, TripState>(
        listener: (context, state) {
          print(startP);
        },
        builder: (context, state) {
          var cubit = TripsCubit.get(context);
          return const Scaffold(
            /*      appBar: AppBar(
              title: const Text('Test Trip'),
            ),
        */
            body: AllBySpEpTrips(),
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
