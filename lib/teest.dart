import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:drive_share/models/components/components.dart';
import 'package:drive_share/network/remote/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class tessst extends StatefulWidget {
  const tessst({super.key});

  @override
  State<tessst> createState() => _tessstState();
}

class _tessstState extends State<tessst> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => TripsCubit(),
        child: BlocConsumer<TripsCubit, TripState>(listener: (context, state) {
          if (state is TripPlanSuccessState) {
            print('Trip created successfully');
          } else if (state is TripPlanErrorState) {
            print('Trip created falid');
          }
        }, builder: (context, state) {
          return Scaffold(
            body: Center(
              child: ConditionalBuilder(
                condition: state is! TripPlanLoadingState,
                builder: (context) => largeButton(
                    text: 'Create Trip',
                    onPressed: () async {
                      TripsCubit.get(context).GetPassengerById();
                      /*UpdateUser(
                          phoneNumber: '44444444',
                          email: 'a',
                          userName: 'a@gmail.com',
                          fName: 'fName',
                          lName: 'lName',
                          imageFile: 'imageFile');*/
                    }),
                fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
              ),
            ),
          );
        }));
  }
}

/*
              print(detail["geometry"]["location"]["lng"].toString() +    " ,  " +          detail["geometry"]["location"]["lat"].toString() );

 */