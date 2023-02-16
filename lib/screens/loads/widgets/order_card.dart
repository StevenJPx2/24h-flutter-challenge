import 'package:flutter/material.dart';
import 'package:flutter_challenge/helpers.dart';
import 'package:flutter_challenge/models/order.dart';
import 'package:niku/namespace.dart' as n;
import 'package:recase/recase.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});

  final Order order;

  TimelineTile getTile(
    Location location,
    IconData icon, {
    bool start = false,
    bool end = false,
  }) =>
      TimelineTile(
        endChild: n.Column([
          n.Box()..h = 10.0,
          location.commaSeparatedLocation.n,
          (location.date != null
                  ? formatDate(location.date!)
                  : "To be determined")
              .n
            ..labelMedium,
          n.Box()..h = 10.0
        ])
          ..crossStart,
        indicatorStyle: IndicatorStyle(
            padding: const EdgeInsets.only(right: 15.0),
            color: Colors.transparent,
            iconStyle: IconStyle(iconData: icon, fontSize: 24.0)),
        isFirst: start,
        isLast: end,
        beforeLineStyle: const LineStyle(color: Colors.black, thickness: 1.0),
        afterLineStyle: const LineStyle(color: Colors.black, thickness: 1.0),
      );
  @override
  Widget build(BuildContext context) {
    return Card(
      child: n.Column([
        n.Row([
          order.pricePerTonne != null
              ? ("Rs ${order.pricePerTonne} Per Tonne".n..titleLarge)
              : ("Price Pending".n..titleSmall),
          RawChip(
              label: order.status.name.titleCase.n
                ..color = Colors.blue.shade900,
              backgroundColor: Colors.blue.shade50),
        ])
          ..spaceBetween,
        n.Column(
          [
            getTile(order.pickUp, Icons.location_pin, start: true),
            getTile(order.dropOff, Icons.flag, end: true),
          ],
        )..crossStart,
        n.Row([
          "${order.weightInTonne} Tonne | ${order.material.name.titleCase} | ${order.transport.name.titleCase}"
              .n,
          n.Icon(Icons.arrow_forward)
        ])
          ..spaceBetween
      ])
        ..crossStart
        ..px = 10.0
        ..pb = 15.0,
    );
  }
}
