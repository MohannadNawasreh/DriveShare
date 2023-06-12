import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'all-acceptpassenger.dart';

class SearchAccepts extends StatelessWidget {
  final int tripId;
  const SearchAccepts({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripsCubit()..GetAllAccept(tripid: tripId),
      child: BlocConsumer<TripsCubit, TripState>(
        listener: (context, state) {
          print(tripId);
        },
        builder: (context, state) {
          var cubit = TripsCubit.get(context);
          return const Scaffold(
            /*      appBar: AppBar(
              title: const Text('Test Trip'),
            ),
        */
            body: AllAcceptsTrips(),
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
