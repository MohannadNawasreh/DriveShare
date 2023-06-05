abstract class TripState {}

class TripInitial extends TripState {}

class TripBottomNav extends TripState {}

class TripGetSuccessState extends TripState {}

class TripGetErrorState extends TripState {
  late String error;
  TripGetErrorState(this.error);
}

class TripLoadingState extends TripState {}



class TripPlanInitialState extends TripState {}


class TripPlanSuccessState extends TripState {}

class TripPlanErrorState extends TripState {
  late String error;
  TripPlanErrorState(this.error);
}

class TripPlanLoadingState extends TripState {}



class CarInitialState extends TripState {}


class CarSuccessState extends TripState {}

class CarErrorState extends TripState {
  late String error;
  CarErrorState(this.error);
}

class CarLoadingState extends TripState {}