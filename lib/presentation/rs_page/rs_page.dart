import 'package:flutter/material.dart';
import 'package:yu_health/core/constants/data_constants.dart';
import 'package:yu_health/presentation/home_page/widgets/card_faskes.dart';

class RsPage extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  const RsPage({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
        vertical: kHorizontalPadding,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return CardFaskes(
          item: item,
          showSeparator: false,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 12),
    );
  }
}
