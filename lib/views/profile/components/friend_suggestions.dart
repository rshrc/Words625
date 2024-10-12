// Flutter imports:
import 'package:flutter/material.dart';

class FriendSuggestions extends StatelessWidget {
  const FriendSuggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        bigTitle(),
        Container(
          margin: const EdgeInsets.only(top: 15, left: 5),
          padding: const EdgeInsets.only(top: 5),
          height: 210.0,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              friendBox('assets/images/cyan.png', 'Cyan', 'Yellow'),
              friendBox('assets/images/impostor.png', 'Impostor', 'Heisenberg'),
              friendBox('assets/images/white.png', 'White', 'Jessie Pinkman'),
              friendBox('assets/images/green.png', 'Green', 'Red'),
              friendBox('assets/images/yellow.png', 'Yellow', 'Pink'),
            ],
          ),
        ),
      ],
    );
  }

  friendBox(String image, String name, String follower) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.all(5),
      width: 145,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 2.5,
          color: const Color(0xFFE5E5E5),
        ),
      ),
      child: Column(
        children: [
          avatar(image),
          friendName(name),
          followedBy(follower),
          const Spacer(),
          followButton(),
        ],
      ),
    );
  }

  followButton() {
    return Container(
      width: double.infinity,
      height: 30,
      margin: const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
      // padding: const EdgeInsets.only(bottom: 2),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1CB0F6),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: const Text(
          'FOLLOW',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  followedBy(String name) {
    return Text(
      'Followed by $name',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFFAFAFAF),
        fontSize: 15,
      ),
      textAlign: TextAlign.center,
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
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: 22,
      ),
    );
  }

  bigTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(top: 20, left: 15),
        child: const Text(
          'Friend Suggestions',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4B4B4B),
          ),
        ),
      ),
    );
  }
}
