// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import 'package:words625/gen/assets.gen.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  String streak = '0';
  String totalXp = '0';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) return;

      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();

      if (userDoc.exists) {
        final userData = userDoc.data() as Map<String, dynamic>;
        setState(() {
          streak = userData['streak']?.toString() ?? '0';
          totalXp = userData['score']?.toString() ?? '0';
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
      }
    } catch (e) {
      setState(() => isLoading = false);
      print("Error fetching user data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        bigTitle('Statistics'),
        GridView.count(
          primary: false,
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: (1 / .4),
          children: [
            statBox(Assets.images.streak.path, streak, 'Day Streak'),
            statBox(Assets.images.electric.path, totalXp, 'Total XP'),
            statBox(Assets.images.pearl.path, 'Pearl', 'Current League'),
            statBox(Assets.images.chest.path, '7', 'Top 3 Finishes'),
          ],
        ),
      ],
    );
  }

  statBox(String iconImage, String record, String label) {
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 2.5,
          color: const Color(0xFFE5E5E5),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                iconImage,
                width: 24,
              ),
              const Padding(
                padding: EdgeInsets.all(7),
              ),
              Text(
                record,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B4B4B),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 38)),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFAFAFAF),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bigTitle(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
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
