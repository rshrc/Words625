// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:words625/core/extensions.dart';
import 'package:words625/core/logger.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .orderBy('score', descending: true)
          .limit(30)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No leaderboard data available'));
        }

        final users = snapshot.data!.docs;

        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final userData = users[index].data() as Map<String, dynamic>;
            final xp = userData['score'] ?? 0;
            final name = userData['name'] ?? 'Anonymous';
            final image =
                userData['profileImage'] ?? 'assets/images/default_image.png';
            final languages = userData['languages'] as List<dynamic>? ?? [];

            logger.w("Line 1: $userData");

            return ListTile(
              contentPadding: const EdgeInsets.only(top: 17),
              horizontalTitleGap: 12,
              leading: rank(index + 1),
              title: avatarWithName(image, name, languages.cast<String>()),
              trailing: xpAmount(xp),
            );
          },
        );
      },
    );
  }

  Widget xpAmount(int xp) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Text(
        '$xp XP',
        style: const TextStyle(fontSize: 17),
      ),
    );
  }

  Widget avatarWithName(String image, String name, List<String> languages) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          avatar(image),
          const Padding(padding: EdgeInsets.only(right: 20)),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4B4B4B),
                    fontSize: 20,
                  ),
                ),
                if (languages.isNotEmpty)
                  Text(
                    languages.join(', ').toTitleCase,
                    style: const TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget avatar(String image) {
    return CircleAvatar(
      backgroundImage: NetworkImage(image),
      radius: 22,
    );
  }

  Widget rank(int rank) {
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
