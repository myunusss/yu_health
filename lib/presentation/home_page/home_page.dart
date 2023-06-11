import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../core/constants/data_constants.dart';
import 'widgets/head_title.dart';
import 'widgets/horizontal_list.dart';
import 'widgets/vertical_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> showedRS = kRumahSakit.take(3).toList();
  List<Map<String, dynamic>> showedKlinik = kKlinik.take(3).toList();

  void onChangeTypeRS(String item) {
    if (item == 'Semua') {
      setState(() {
        showedRS = kRumahSakit.take(3).toList();
      });
    } else {
      setState(() {
        showedRS = kRumahSakit.where((element) => (element['types'] as List).contains(item)).toList();
      });
    }
  }

  void onChangeTypeKlinik(String item) {
    if (item == 'Semua') {
      setState(() {
        showedKlinik = kKlinik.take(3).toList();
      });
    } else {
      setState(() {
        showedKlinik = kKlinik.where((element) => (element['types'] as List).contains(item)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Head Title Rumah Sakit
            const HeadTitle(
              horizontalPadding: kHorizontalPadding,
              title: 'Rumah Sakit',
            ),
            // Horizontal List Tipe Rumah Sakit
            HorizontalList(
              horizontalPadding: kHorizontalPadding,
              tipeRumahSakit: kTipeRumahSakit,
              onPressed: onChangeTypeRS,
            ),
            // Vertical List Rumah Sakit
            VerticalList(
              items: showedRS,
            ),
            const SizedBox(height: 12),
            // Banner Carousel
            CarouselSlider(
              options: CarouselOptions(
                height: 130.0,
                viewportFraction: 0.7,
                enableInfiniteScroll: false,
                padEnds: false,
              ),
              items: kBannerContents.map(
                (i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.grey.shade100),
                        child: CachedNetworkImage(
                          imageUrl: i['image'] ?? "http://via.placeholder.com/350x150",
                          progressIndicatorBuilder: (context, url, downloadProgress) => Container(
                            padding: const EdgeInsets.all(30),
                            width: 130,
                            height: 130,
                            child: CircularProgressIndicator(value: downloadProgress.progress),
                          ),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      );
                    },
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 12),
            // Head Title Klinik
            const HeadTitle(
              horizontalPadding: kHorizontalPadding,
              title: 'Klinik',
            ),
            // Horizontal List Tipe Klinik
            HorizontalList(
              horizontalPadding: kHorizontalPadding,
              tipeRumahSakit: kTipeKlinik,
              onPressed: onChangeTypeKlinik,
            ),
            // Vertical List Klinik
            VerticalList(
              items: showedKlinik,
            ),
          ],
        ),
      ),
    );
  }
}
