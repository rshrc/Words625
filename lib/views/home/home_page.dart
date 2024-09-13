// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';

// Project imports:
import 'package:words625/views/courses/course_tree.dart';
import 'package:words625/views/explore/explore_page.dart';
import 'package:words625/views/home/components/components.dart';
import 'package:words625/views/leaderboard/leaderboard_page.dart';
import 'package:words625/views/profile/profile_screen.dart';
import 'package:words625/views/shop/shop_screen.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final screens = [
    const CourseTree(),
    const ProfilePage(),
    LeaderboardPage(),
    const ShopPage(),
    const ExplorePage(),
  ];

  final List<PreferredSizeWidget> appBars = [
    const StatAppBar(),
    const ProfileAppBar(),
    const LeaderboardAppBar(),
    const ShopAppBar(),
    const ExploreAppBar(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBars[currentIndex],
      bottomNavigationBar: BottomNavigator(
          currentIndex: currentIndex, onPress: onBottomNavigatorTapped),
      body: screens[currentIndex],
    );
  }

  void onBottomNavigatorTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
