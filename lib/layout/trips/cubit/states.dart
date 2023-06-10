abstract class TripState {}

class TripPlanInitialState extends TripState {}

class TripPlanSuccessState extends TripState {}

class TripPlanErrorState extends TripState {
  late String error;
  TripPlanErrorState(this.error);
}

class TripPlanLoadingState extends TripState {}


