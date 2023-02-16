import 'package:flutter/material.dart';
import 'package:flutter_challenge/screens/loads/view.dart';
import 'package:flutter_challenge/screens/order/view.dart';
import 'package:flutter_challenge/screens/truck_detail/view.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'HaulX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.blueGrey.shade600),
          labelMedium: TextStyle(color: Colors.grey.shade700),
          labelLarge: TextStyle(color: Colors.grey.shade600),
          titleMedium: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      routerConfig: GoRouter(routes: [
        GoRoute(
          path: "/",
          builder: (context, state) => const LoadScreen(),
        ),
        GoRoute(
          path: "/orders/:id",
          builder: (context, state) => OrderScreen(
            orderId: int.parse(state.params["id"]!),
          ),
        ),
        GoRoute(
          path: "/orders/:id/truck-details",
          builder: (context, state) => TruckDetailScreen(
            orderId: int.parse(state.params["id"]!),
          ),
        )
      ]),
    );
  }
}
