import 'package:flutter_challenge/models/order.dart';

final List<Order> orders = [
  Order(
    id: 1,
    status: Status.scheduled,
    pickUp: Location(
      "Delhi Division",
      "Delhi",
      date: DateTime(2023, 1, 31),
    ),
    dropOff: Location("Delhi Division", "Delhi"),
    material: Material.steel,
    transport: Transport.container,
    weightInTonne: 25.0,
    fleetOperator: FleetOperator(
      companyName: "SN Logistics",
      operatorName: "Sanchit Nar",
      phoneNumber: "8595114160",
    ),
    truckDetail: TruckDetail(
      id: 35,
      registration: "W34567",
      driver: TruckDriverDetail("Sanchit Narang", "8595114164"),
      truckStatus: TruckStatus.delivered,
    ),
  ),
  Order(
    id: 2,
    status: Status.pending,
    pickUp: Location(
      "Shreerang Society, Thane West, Thane",
      "Maharashtra",
      date: DateTime(2023, 1, 26),
    ),
    dropOff: Location("Rohini, New Delhi", "Delhi"),
    material: Material.steel,
    transport: Transport.trailer,
    weightInTonne: 20.0,
    fleetOperator: FleetOperator(
      companyName: "SN Logistics",
      operatorName: "Sanchit Nar",
      phoneNumber: "8595114160",
    ),
    truckDetail: TruckDetail(
      id: 38,
      registration: "W34567",
      driver: TruckDriverDetail("Sanchit Narang", "8595114164"),
      truckStatus: TruckStatus.inTransit,
    ),
  ),
  Order(
    id: 3,
    status: Status.complete,
    pickUp: Location(
      "Delhi Division",
      "Delhi",
      date: DateTime(2023, 1, 12),
    ),
    dropOff: Location(
      "HAL Colony, Indiranagar",
      "Karnataka",
      date: DateTime(2023, 1, 22),
    ),
    material: Material.furniture,
    transport: Transport.container,
    weightInTonne: 25.0,
    fleetOperator: FleetOperator(
      companyName: "SN Logistics",
      operatorName: "Sanchit Nar",
      phoneNumber: "8595114160",
    ),
    truckDetail: TruckDetail(
      id: 24,
      registration: "W34567",
      driver: TruckDriverDetail("Sanchit Narang", "8595114164"),
      truckStatus: TruckStatus.delivered,
    ),
  ),
];

Order getOrderById(int id) => orders.firstWhere((order) => order.id == id);
