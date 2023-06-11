import 'package:flutter/material.dart';
import 'package:yu_health/presentation/home_page/widgets/card_faskes.dart';

class VerticalList extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  const VerticalList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        children: items.map(
          (e) {
            final item = e;
            return CardFaskes(
              item: item,
              showSeparator: item == items.last ? false : true,
            );
          },
        ).toList(),
      ),
    );
  }
}
