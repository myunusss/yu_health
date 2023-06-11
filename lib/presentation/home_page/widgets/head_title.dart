import 'package:flutter/material.dart';

class HeadTitle extends StatelessWidget {
  const HeadTitle({
    super.key,
    required this.horizontalPadding,
    required this.title,
  });

  final double horizontalPadding;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Text(
              'Lihat semua',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
