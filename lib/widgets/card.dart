import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

class Card extends StatelessWidget {
  const Card({
    super.key,
    this.child = const SizedBox.shrink(),
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return n.Box(child)
      ..bg = Colors.white
      ..elevation = 20.0
      ..borderRadius = const BorderRadius.all(Radius.circular(10.0));
  }
}
