// Markus Nugraha Sembodo
// C14210251

import 'package:flutter/material.dart';
import 'package:uts_ambw/widgets/bookmarkWidget.dart';
import 'package:uts_ambw/widgets/discoveryWidget.dart';
import 'package:uts_ambw/widgets/homeWidget.dart';
import 'package:uts_ambw/widgets/profileWidget.dart';
import 'package:uts_ambw/widgets/topFoodieWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int pilihanMenu = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomeWidget(),
    const DiscoveryWidget(),
    const BookmarkWidget(),
    const TopFoodieWidget(),
    const ProfileWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
              ),
              const SizedBox(width: 90),
              const Text(
                "My Location",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: _widgetOptions.elementAt(pilihanMenu),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Discovery",
              icon: Icon(Icons.location_on_outlined),
            ),
            BottomNavigationBarItem(
              label: "Bookmark",
              icon: Icon(Icons.bookmark_add_outlined),
            ),
            BottomNavigationBarItem(
              label: "Top Foodie",
              icon: Icon(Icons.leaderboard_outlined),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person_2_outlined),
            ),
          ],
          currentIndex: pilihanMenu,
          onTap: (int index) {
            setState(() {
              pilihanMenu = index;
            });
          },
        ),
      ),
    );
  }
}
