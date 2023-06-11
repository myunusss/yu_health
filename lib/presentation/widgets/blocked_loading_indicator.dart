import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BlockedLoadingIndicator extends StatelessWidget {
  final double? height;
  final String? semanticsLabel;

  const BlockedLoadingIndicator({
    Key? key,
    this.height,
    this.semanticsLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(12),
          width: 140,
          height: 140,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SpinKitCircle(
                itemBuilder: (_, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.pink : Colors.blue,
                      borderRadius: BorderRadius.circular(40),
                    ),
                  );
                },
                size: 60.0,
              ),
              const SizedBox(height: 4),
              const Text(
                'Loading...',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.orange,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
