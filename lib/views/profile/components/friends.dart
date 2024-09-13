// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

class Friends extends StatelessWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        bigTitle('Friends'),
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          height: 344,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 2.5,
              color: const Color(0xFFE5E5E5),
            ),
          ),
          child: ContainedTabBarView(
            tabBarProperties: const TabBarProperties(
              indicatorColor: Color(0xFF1CB0F6),
              indicatorWeight: 3,
            ),
            tabs: [tabBarText('FOLLOWING'), tabBarText('FOLLOWERS')],
            views: [following(), followers()],
          ),
        ),
      ],
    );
  }


  followers() {
    return ListView(
      shrinkWrap: true,
      children: [
        friend('assets/images/profile.png', 'Wanda', '314'),
        friend('assets/images/profile.jpg', 'Marc', '2012'),
        friend('assets/images/profile.jpg', 'Marc', '2012'),
        friend('assets/images/white.png', 'Batman', '10234'),
        friend('assets/images/cyan.png', 'vinod', '893'),
        friend('assets/images/profile.jpg', 'Marc', '2012'),
        friend('assets/images/profile.jpg', 'Marc', '2012'),
        friend('assets/images/profile.jpg', 'Marc', '2012'),
      ],
    );
  }

  following() {
    return ListView(
      shrinkWrap: true,
      children: [
        friend('assets/images/white.png', 'Batman', '10234'),
        friend('assets/images/cyan.png', 'vinod', '893'),
        friend('assets/images/profile.png', 'Wanda', '314'),
        friend('assets/images/profile.jpg', 'Marc', '2012'),
        friend('assets/images/profile.jpg', 'Marc', '2012'),
        friend('assets/images/profile.jpg', 'Marc', '2012'),
        friend('assets/images/profile.jpg', 'Marc', '2012'),
      ],
    );
  }

  friend(String image, String name, String xp) {
    return Container(
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFE5E5E5),
        ),
      ),
      child: Row(
        children: [
          avatar(image),
          const Padding(padding: EdgeInsets.all(5)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              friendName(name),
              xpAmount(xp),
            ],
          )
        ],
      ),
    );
  }

  xpAmount(String xp) {
    return Text(
      '$xp XP',
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Color(0xFFAFAFAF),
      ),
    );
  }

  friendName(String name) {
    return Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF4B4B4B),
        fontSize: 17,
      ),
    );
  }

  avatar(String image) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      margin: const EdgeInsets.all(10),
      child: CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: 22,
      ),
    );
  }

  tabBarText(String text) {
    return Text(
      text,
      style: const TextStyle(
          color: Color(0xFF777777), fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  bigTitle(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(top: 20, left: 15, bottom: 10),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4B4B4B),
          ),
        ),
      ),
    );
  }
}
