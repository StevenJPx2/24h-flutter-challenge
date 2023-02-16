import 'package:flutter/material.dart';
import 'package:flutter_challenge/helpers.dart';
import 'package:flutter_challenge/models/order.dart';
import 'package:flutter_challenge/repos/orders.dart';
import 'package:flutter_challenge/widgets/detail_item.dart';
import 'package:flutter_challenge/widgets/status_timeline.dart';
import 'package:go_router/go_router.dart';
import 'package:niku/namespace.dart' as n;
import 'package:recase/recase.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key, required this.orderId});

  final int orderId;

  @override
  Widget build(BuildContext context) {
    Order order = getOrderById(orderId);
    return Scaffold(
      appBar: AppBar(
        title: "Order #$orderId".n,
        leading: n.IconButton(Icons.arrow_back)
          ..onPressed = () => context.pop(),
        actions: [n.Icon(Icons.more_vert)],
      ),
      body: n.ListView.children([
        Card(
          child: n.Column([
            n.Row([
              n.Column([
                "Pickup Location".n..labelLarge,
                order.pickUp.commaSeparatedLocation.n,
                n.Box()..h = 15.0,
                "Drop Location".n..labelLarge,
                order.dropOff.commaSeparatedLocation.n
              ])
                ..maxW = 180.0
                ..crossStart,
              n.Icon(Icons.fire_truck)..size = 100.0
            ])
              ..spaceBetween,
            n.Box()..h = 10.0,
            DetailItem(descriptor: "Order ID", item: order.id.toString()),
            DetailItem(
              descriptor: "Pickup Date",
              item: (order.pickUp.date != null
                  ? formatDate(order.pickUp.date!)
                  : "To be determined"),
            ),
            DetailItem(
              descriptor: "Preferred Vehicle",
              item: order.transport.name.titleCase,
            ),
            DetailItem(
              descriptor: "Quantity of load",
              item: "${order.weightInTonne} Tonne",
            ),
            DetailItem(
              descriptor: "Material Type",
              item: order.material.name.titleCase,
            ),
          ])
            ..px = 10.0
            ..py = 10.0,
        ),
        Card(
          child: n.Column([
            "Load Status".n..titleMedium,
            n.Box()..h = 7.0,
            getStatus(Status.values, order.status),
          ])
            ..crossStart
            ..px = 10.0
            ..py = 10.0,
        ),
        Card(
          child: n.Column([
            "Fleet Operator".n..titleMedium,
            n.Box()..h = 7.0,
            DetailItem(
              descriptor: "Company Name",
              item: order.fleetOperator.companyName,
            ),
            DetailItem(
              descriptor: "Operator Name",
              item: order.fleetOperator.operatorName,
            ),
            DetailItem(
              descriptor: "Phone Number",
              item: order.fleetOperator.phoneNumber,
            ),
          ])
            ..crossStart
            ..px = 10.0
            ..py = 10.0,
        ),
        Card(
          child: n.Column([
            "Truck and Driver".n..titleMedium,
            n.Box()..h = 7.0,
            n.Row([
              n.Column([
                DetailItem(
                  descriptor: "Truck No:",
                  item: order.truckDetail.registration,
                  hasPadding: false,
                ),
                DetailItem(
                  descriptor: "Driver No:",
                  item: order.truckDetail.driver.phoneNumber,
                  hasPadding: false,
                ),
                n.Row([
                  n.Icon(Icons.arrow_right)..color = Colors.green,
                  order.truckDetail.truckStatus.name.titleCase.n
                    ..color = Colors.green,
                ])
              ])
                ..crossStart,
              Chip(
                label: "Live Status".n..color = Colors.white,
                backgroundColor: Colors.green,
              ).niku
                ..on(
                  tap: () => context.push("/orders/$orderId/truck-details"),
                ),
            ])
              ..spaceBetween
          ])
            ..crossStart
            ..px = 10.0
            ..py = 10.0,
        )
      ]),
    );
  }
}
