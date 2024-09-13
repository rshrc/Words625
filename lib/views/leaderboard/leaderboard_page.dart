// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

Random random = Random();

class LeaderboardPage extends StatelessWidget {
  LeaderboardPage({Key? key}) : super(key: key);

  var ranks = List<int>.generate(30, (i) => i + 1);
  var xps = List<int>.generate(30, (i) => random.nextInt(1000));
  var nameList = [
    'Nikhil',
    'Pratik',
    'Sushant',
    'Kaushal',
    'Dhruv',
    'Kishore',
    'Akshaj',
    'Dash'
  ];
  var imageList = [
    'white.png',
    'profile.jpg',
    'green.png',
    'cyan.png',
    'yellow.png'
  ];

  @override
  Widget build(BuildContext context) {
    // generate mock data
    var names = List<String>.generate(
        30, (i) => nameList[random.nextInt(nameList.length)]);
    var images = List<String>.generate(30,
        (i) => 'assets/images/${imageList[random.nextInt(imageList.length)]}');

    return ListView.builder(
      itemCount: 30,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          contentPadding: const EdgeInsets.only(top: 17),
          horizontalTitleGap: 12,
          leading: rank(ranks[index]),
          title: avatarWithName(images[index], names[index]),
          trailing: xpAmount(xps[index]),
        );
      },
    );
  }

  xpAmount(int xp) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Text(
        '$xp XP',
        style: const TextStyle(fontSize: 17),
      ),
    );
  }

  avatarWithName(String image, String name) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          avatar(image),
          const Padding(padding: EdgeInsets.only(right: 20)),
          friendName(name),
        ],
      ),
    );
  }

  friendName(String name) {
    return Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF4B4B4B),
        fontSize: 20,
      ),
    );
  }

  avatar(String image) {
    return Container(
      // padding: const EdgeInsets.only(top: 5),
      // margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: 22,
      ),
    );
  }

  rank(int rank) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      child: Text(
        '$rank',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF58CC02),
        ),
      ),
    );
  }
}
