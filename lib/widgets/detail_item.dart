import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

class DetailItem extends StatelessWidget {
  const DetailItem({
    super.key,
    required this.descriptor,
    required this.item,
    this.hasPadding = true,
  });

  final String descriptor;
  final String item;
  final bool hasPadding;

  @override
  Widget build(BuildContext context) {
    return n.Row([descriptor.n..labelLarge, item.n])
      ..spaceBetween
      ..pb = hasPadding ? 10.0 : 0;
  }
}
