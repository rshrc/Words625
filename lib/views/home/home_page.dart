// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:words625/character_drawing.dart';

// Project imports:
import 'package:words625/views/courses/course_tree.dart';
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
    const CharacterPracticeScreen(),
    const ProfilePage(),
    LeaderboardPage(),
    const ShopPage(),
    // const ExplorePage(),
  ];

  final List<PreferredSizeWidget> appBars = [
    const StatAppBar(),
    AppBar(
      title: Column(
        children: [
          Text(
            "The Alphabet",
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Let's learn the Kannada Script",
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      toolbarHeight: 120,
      backgroundColor: Colors.white,
      elevation: 1.5,
      centerTitle: true,
    ),
    const ProfileAppBar(),
    const LeaderboardAppBar(),
    const ShopAppBar(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBars[currentIndex],
      bottomNavigationBar: BottomNavigator(
        currentIndex: currentIndex,
        onPress: onBottomNavigatorTapped,
      ),
      body: screens[currentIndex],
    );
  }

  void onBottomNavigatorTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}

class CharacterLearningPage extends StatelessWidget {
  const CharacterLearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CharacterPracticeScreen();
  }
}
