import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  CachedNetworkImage(
                    width: 50,
                    height: 50,
                    imageUrl:
                        'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg',
                    progressIndicatorBuilder: (context, url, downloadProgress) => Container(
                      padding: const EdgeInsets.all(12),
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(value: downloadProgress.progress),
                    ),
                    imageBuilder: (context, imageProvider) => Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Muhammad Yunus Turmudi',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '085871321037',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'Aktif',
                      style: TextStyle(color: Colors.green, fontSize: 12),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
