import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardFaskes extends StatelessWidget {
  final Map<String, dynamic> item;
  final bool showSeparator;

  const CardFaskes({
    super.key,
    required this.item,
    required this.showSeparator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CachedNetworkImage(
              width: 50,
              height: 50,
              imageUrl: item['image'] ?? "http://via.placeholder.com/350x150",
              progressIndicatorBuilder: (context, url, downloadProgress) => Container(
                padding: const EdgeInsets.all(12),
                width: 50,
                height: 50,
                child: CircularProgressIndicator(value: downloadProgress.progress),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item['name'].toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'Lihat detail',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(item['alamat'].toString()),
                ],
              ),
            ),
          ],
        ),
        showSeparator ? const SizedBox(height: 12) : const SizedBox.shrink(),
      ],
    );
  }
}
