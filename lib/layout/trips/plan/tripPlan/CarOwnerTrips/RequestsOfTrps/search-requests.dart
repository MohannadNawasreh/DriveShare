import 'dart:ffi';

import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:drive_share/network/remote/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'all-requests.dart';

class SearchRequests extends StatelessWidget {
  final int tripId;
  const SearchRequests({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripsCubit()..GetAllRequest(tripid: tripId),
      child: BlocConsumer<TripsCubit, TripState>(
        listener: (context, state) {
          print(tripId);
          CacheHelper.saveData(key: 'tripId', value: tripId);
        },
        builder: (context, state) {
          var cubit = TripsCubit.get(context);
          return Scaffold(
            /*      appBar: AppBar(
              title: const Text('Test Trip'),
            ),
        */
            body: AllRequestsTrips(),
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
