// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Project imports:
import 'package:words625/gen/assets.gen.dart';
import 'package:words625/views/widgets/loader.dart';

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
      leading: const KarnatakaFlag(),
      title: const Row(
        children: [
          Padding(padding: EdgeInsets.all(20)),
          ScoreCard(),
          Padding(padding: EdgeInsets.all(20)),
          Streak(),
        ],
      ),
      actions: const [
        InfinityHeart(),
      ],
    );
  }
}

class Streak extends StatelessWidget {
  const Streak({super.key});

  Stream<int> _getUserStreakStream() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      // Return a stream with a default value if the user is not logged in
      return Stream.value(0);
    }

    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snapshot) => (snapshot.data()?['streak'] ?? 0) as int);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Assets.images.streak.path,
          width: 24,
        ),
        const Padding(
          padding: EdgeInsets.all(4),
        ),
        StreamBuilder<int>(
          stream: _getUserStreakStream(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loader();
            }
            if (snapshot.hasError) {
              return const Text('Error');
            }

            return Text(
              '${snapshot.data}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF9600),
              ),
            );
          },
        ),
      ],
    );
  }
}

class ScoreCard extends StatelessWidget {
  const ScoreCard({super.key});

  Stream<int> _getUserScoreStream() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      // Return a stream with a default value if the user is not logged in
      return Stream.value(0);
    }

    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots()
        .map((snapshot) => (snapshot.data()?['score'] ?? 0) as int);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Assets.images.crown.path,
          width: 30,
        ),
        const Padding(
          padding: EdgeInsets.all(4),
        ),
        StreamBuilder<int>(
          stream: _getUserScoreStream(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loader();
            }
            if (snapshot.hasError) {
              return const Text('Error');
            }

            return Text(
              '${snapshot.data}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFC800),
              ),
            );
          },
        ),
      ],
    );
  }
}

class InfinityHeart extends StatelessWidget {
  const InfinityHeart({super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Infinite Hearts',
      triggerMode: TooltipTriggerMode.tap,
      child: Row(
        children: [
          Image.asset(
            Assets.images.heart.path,
            width: 36,
          ),
          const Padding(
            padding: EdgeInsets.all(2),
          ),
          Image.asset(Assets.images.infinity.path, width: 20),
          const Padding(
            padding: EdgeInsets.all(5),
          ),
        ],
      ),
    );
  }
}

class KarnatakaFlag extends StatelessWidget {
  const KarnatakaFlag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 18, bottom: 18),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.scaleDown,
          image: AssetImage(Assets.images.karnatakaFlag.path),
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
