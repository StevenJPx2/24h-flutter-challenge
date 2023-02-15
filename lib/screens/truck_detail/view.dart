import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/order.dart';
import 'package:flutter_challenge/repos/orders.dart';
import 'package:flutter_challenge/widgets/detail_item.dart';
import 'package:flutter_challenge/widgets/status_timeline.dart';
import 'package:go_router/go_router.dart';
import 'package:niku/namespace.dart' as n;

class TruckDetailScreen extends StatelessWidget {
  const TruckDetailScreen({super.key, required this.orderId});

  final int orderId;

  @override
  Widget build(BuildContext context) {
    final order = getOrderById(orderId);
    final fleetOperator = order.fleetOperator;
    final truckDetail = order.truckDetail;

    return Scaffold(
      appBar: AppBar(
        leading: n.IconButton(Icons.arrow_back)
          ..onPressed = () => context.pop(),
        title: "Truck Detail".n,
      ),
      body: n.ListView.children([
        Card(
          child: n.Column([
            "Fleet Operator".n..titleMedium,
            DetailItem(
              descriptor: "Company Name",
              item: fleetOperator.companyName,
            ),
            DetailItem(
              descriptor: "Operator Name",
              item: fleetOperator.operatorName,
            ),
            DetailItem(
              descriptor: "Phone Number",
              item: fleetOperator.phoneNumber,
            ),
          ])
            ..px = 10.0
            ..py = 10.0,
        ),
        Card(
          child: n.Column([
            "Truck and Driver".n..titleMedium,
            DetailItem(descriptor: "Truck ID", item: truckDetail.id.toString()),
            DetailItem(
              descriptor: "Truck Registration Number",
              item: truckDetail.registration,
            ),
            DetailItem(
              descriptor: "Driver Name",
              item: truckDetail.driver.name,
            ),
            DetailItem(
              descriptor: "Driver Phone Number",
              item: truckDetail.driver.phoneNumber,
            ),
          ])
            ..px = 10.0
            ..py = 10.0,
        ),
        Card(
          child: n.Column([
            "Truck Status".n..titleMedium,
            getStatus(TruckStatus.values, truckDetail.truckStatus),
          ])
            ..px = 10.0
            ..py = 10.0,
        ),
      ]),
    );
  }
}
