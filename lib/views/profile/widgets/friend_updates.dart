// Flutter imports:
import 'package:flutter/material.dart';

class FriendUpdates extends StatelessWidget {
  const FriendUpdates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 2.5,
          color: const Color(0xFFE5E5E5),
        ),
      ),
      child: Row(
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          // Icon(Icons.celebration, size: 40, color: Color(0xFFFF4B4B)),
          Image.asset(
            'assets/images/celebrate.png',
            width: 40,
          ),
          const Padding(padding: EdgeInsets.all(10)),
          const Text(
            'Friend updates',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFF4B4B4B),
            ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 20, color: Color(0xFFAFAFAF)),
          const Padding(padding: EdgeInsets.all(10)),
        ],
      ),
    );
  }
}
