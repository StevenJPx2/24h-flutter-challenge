import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

// ignore: must_be_immutable
class Card extends StatelessWidget {
  Card({super.key, required this.child});

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
