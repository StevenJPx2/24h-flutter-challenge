enum Status {
  pending,
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

  Location(this.locality, this.city, {this.date});
}

class Order {
  final double? pricePerTonne;
  final Status status;
  final Location pickUp;
  final Location dropOff;
  final double? weightInTonne;
  final Material material;
  final Transport transport;

  Order({
    this.pricePerTonne,
    required this.status,
    required this.pickUp,
    required this.dropOff,
    this.weightInTonne,
    required this.material,
    required this.transport,
  });
}
