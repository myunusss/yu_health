import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({
    super.key,
    required this.horizontalPadding,
    required this.tipeRumahSakit,
    required this.onPressed,
  });

  final double horizontalPadding;
  final List<String> tipeRumahSakit;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34.0,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        itemCount: tipeRumahSakit.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                onPressed: () {
                  onPressed(tipeRumahSakit[index]);
                },
                child: Text(
                  tipeRumahSakit[index],
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
