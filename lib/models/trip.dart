class Trip {
  String? carOwnerName;
  int? seatNumber;
  String? startPoint;
  String? endPoint;
  String? description;
  DateTime? tripTime;
  String? priceTrip;

  Trip(
      {required this.carOwnerName,
      required this.seatNumber,
      required this.startPoint,
      required this.endPoint,
      required this.description,
      required this.tripTime,
      required this.priceTrip,
      });
}
