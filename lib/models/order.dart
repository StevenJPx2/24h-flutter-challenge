enum Status {
  pending,
  quoted,
  scheduled,
  inProgress,
  complete;
}

enum Material {
  steel,
  furniture;
}

enum Transport {
  container,
  trailer;
}

class Location {
  final String locality;
  final String city;
  final DateTime? date;
  final String commaSeparatedLocation;

  Location(this.locality, this.city, {this.date})
      : commaSeparatedLocation = "$locality, $city";
}

class Order {
  final int id;
  final double? pricePerTonne;
  final Status status;
  final Location pickUp;
  final Location dropOff;
  final double weightInTonne;
  final Material material;
  final Transport transport;
  final FleetOperator fleetOperator;
  final TruckDetail truckDetail;

  Order({
    required this.id,
    this.pricePerTonne,
    required this.status,
    required this.pickUp,
    required this.dropOff,
    required this.weightInTonne,
    required this.material,
    required this.transport,
    required this.fleetOperator,
    required this.truckDetail,
  });
}

class TruckDetail {
  final int id;
  final String registration;
  final TruckDriverDetail driver;
  final TruckStatus truckStatus;

  TruckDetail({
    required this.id,
    required this.registration,
    required this.driver,
    required this.truckStatus,
  });
}

enum TruckStatus {
  pickup,
  inTransit,
  atDropOff,
  delivered;
}

class TruckDriverDetail {
  final String name;
  final String phoneNumber;

  TruckDriverDetail(this.name, this.phoneNumber);
}

class FleetOperator {
  final String companyName;
  final String operatorName;
  final String phoneNumber;

  FleetOperator({
    required this.companyName,
    required this.operatorName,
    required this.phoneNumber,
  });
}
