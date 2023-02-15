import 'package:flutter/material.dart' hide Material;
import 'package:flutter_challenge/repos/orders.dart';
import 'package:flutter_challenge/screens/loads/widgets/order_card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:niku/namespace.dart' as n;

class LoadScreen extends HookWidget {
  const LoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 2);

    return Scaffold(
        appBar: AppBar(
          title: "My Loads".n,
          bottom: TabBar(
            controller: tabController,
            tabs: [
              "Ongoing".n,
              "Past".n,
            ],
            labelPadding: const EdgeInsets.only(bottom: 10.0),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(
              icon: n.Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: n.Icon(Icons.fire_truck),
              label: 'My Loads',
            ),
            BottomNavigationBarItem(
              icon: n.Icon(Icons.person),
              label: 'Account',
            )
          ],
        ),
        body: n.ListView.children(
          orders
              .map((order) => OrderCard(order: order).niku
                ..mb = 20.0
                ..on(
                  tap: () => context.push("/orders/${order.id}"),
                ))
              .toList(),
        )
          ..mx = 20.0
          ..mt = 20.0);
  }
}
