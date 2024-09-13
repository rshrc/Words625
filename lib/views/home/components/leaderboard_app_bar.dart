// Flutter imports:
import 'package:flutter/material.dart';

class LeaderboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LeaderboardAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(250);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 250,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 2.0,
      title: Column(
        children: [
          leagues(),
          bigTitle('Amethyst League'),
          message('Top 10 advance to the next league'),
          remainingDay('2 days'),
        ],
      ),
    );
  }

  leagues() {
    ScrollController controller =
        ScrollController(initialScrollOffset: 89.8 * 4.4);

    return SizedBox(
      height: 100,
      child: ListView(
        // itemExtent: 80,
        controller: controller,
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          Image.asset('assets/images/badge_bronze_blank.png'),
          Image.asset('assets/images/badge_silver_blank.png'),
          Image.asset('assets/images/badge_gold_blank.png'),
          Image.asset('assets/images/badge_diamond_blank.png'),
          Image.asset('assets/images/badge_ruby_blank.png'),
          Image.asset('assets/images/badge_emerald_blank.png'),
          Container(
            margin: const EdgeInsets.only(left: 12, right: 8),
            child: Image.asset('assets/images/badge_amethyst.png', scale: 0.5),
          ),
          Image.asset('assets/images/badge_locked.png'),
          Image.asset('assets/images/badge_locked.png'),
          Image.asset('assets/images/badge_locked.png'),
        ],
      ),
    );
  }

  remainingDay(String text) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Color(0xFFFFC800),
        ),
      ),
    );
  }

  message(String text) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          color: Color(0xFFAFAFAF),
        ),
      ),
    );
  }

  bigTitle(String text) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color(0xFF4B4B4B),
        ),
      ),
    );
  }
}
