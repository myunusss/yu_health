import 'package:flutter/material.dart';
import 'package:yu_health/core/app_routes.dart';
import 'package:yu_health/core/constants/data_constants.dart';
import 'package:yu_health/core/navigation.dart';
import 'package:yu_health/presentation/home_page/home_page.dart';
import 'package:yu_health/presentation/profile_page/profile_page.dart';
import 'package:yu_health/presentation/rs_page/rs_page.dart';

import '../../core/constants/asset_constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController pageController = PageController();

  int _selectedIndex = 0; //New
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 3
          ? null
          : AppBar(
              backgroundColor: Theme.of(context).colorScheme.background,
              title: const Text('Yu Health'),
              titleSpacing: 0.0,
              shadowColor: Colors.grey,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: 'yu_health_logo',
                  createRectTween: (begin, end) {
                    return MaterialRectArcTween(begin: begin, end: end);
                  },
                  child: Image.asset(
                    AssetConstants.icYuHealth,
                    fit: BoxFit.contain,
                    width: 18,
                    height: 18,
                  ),
                ),
              ),
              actions: [
                PopupMenuButton<int>(
                  icon: const Icon(
                    Icons.settings_outlined,
                    color: Colors.black,
                  ),
                  offset: const Offset(0, 40),
                  color: Colors.white,
                  itemBuilder: (context) => [
                    // PopupMenuItem 1
                    const PopupMenuItem(
                      value: 1,
                      // row with 2 children
                      child: Row(
                        children: [
                          Icon(Icons.logout_outlined),
                          SizedBox(width: 10),
                          Text("Log Out"),
                        ],
                      ),
                    ),
                  ],

                  // on selected we show the dialog box
                  onSelected: (value) {
                    if (value == 1) {
                      Navigation.intentAndRemove(AppRoutes.kLoginRoute);
                    }
                  },
                ),
              ],
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Yunus Turmudi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '085871321037',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital_rounded),
            label: 'RS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.health_and_safety),
            label: 'Klinik',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: 'Profile',
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          const HomePage(),
          RsPage(
            items: kRumahSakit,
          ),
          RsPage(items: kKlinik),
          const ProfilePage(),
        ],
      ),
    );
  }
}
