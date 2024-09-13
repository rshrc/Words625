// Flutter imports:
import 'package:flutter/material.dart';

class StatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StatAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 120,
      backgroundColor: Colors.white,
      elevation: 1.5,
      leading: flag(),
      title: Row(
        children: [
          const Padding(padding: EdgeInsets.all(20)),
          crown(136),
          const Padding(padding: EdgeInsets.all(20)),
          streak(31),
        ],
      ),
      actions: [
        heart(),
      ],
    );
  }

  Widget heart() {
    return Row(
      children: [
        Image.asset(
          'assets/images/heart.png',
          width: 36,
        ),
        const Padding(
          padding: EdgeInsets.all(2),
        ),
        Image.asset('assets/images/infinity.png', width: 20),
        const Padding(
          padding: EdgeInsets.all(5),
        ),
      ],
    );
  }

  Widget streak(int n) {
    return Row(
      children: [
        Image.asset(
          'assets/images/streak.png',
          width: 24,
        ),
        const Padding(
          padding: EdgeInsets.all(4),
        ),
        Text(
          '$n',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFFF9600),
          ),
        )
      ],
    );
  }

  Widget crown(int n) {
    return Row(
      children: [
        Image.asset(
          'assets/images/crown.png',
          width: 30,
        ),
        const Padding(
          padding: EdgeInsets.all(4),
        ),
        Text(
          '$n',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFC800),
          ),
        )
      ],
    );
  }

  Widget flag() {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 18, bottom: 18),
      decoration: BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.scaleDown,
          image: AssetImage('assets/images/karnataka-flag.png'),
          // fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 2.5,
          color: const Color(0xFFE5E5E5),
        ),
        color: Colors.grey.shade100,
      ),
      child: null /* add child content here */,
    );
  }
}
