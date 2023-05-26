class Trip {
  String? carOwnerName;
  int? seatNumber;
  String? startPoint;
  String? endPoint;
  String? description;
  DateTime? tripTime;
  String? priceTrip;
  double? Isactive;
  List<String>? Sp;

  Trip({
    required this.carOwnerName,
    required this.seatNumber,
    required this.startPoint,
    required this.endPoint,
    this.description,
    required this.tripTime,
    required this.priceTrip,
    this.Isactive,
    this.Sp,
  });
}
