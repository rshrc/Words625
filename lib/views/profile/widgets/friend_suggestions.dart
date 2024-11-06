// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:words625/core/extensions.dart';
import 'package:words625/views/profile/widgets/follow_button.dart';

class FriendSuggestions extends StatelessWidget {
  const FriendSuggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BigTitle(text: "Friend Suggestions"),
        Container(
          margin: const EdgeInsets.only(top: 15, left: 5),
          padding: const EdgeInsets.only(top: 5),
          height: context.height * 0.25,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(
                    child: Text('No friend suggestions available'));
              }
              final friends = snapshot.data!.docs;

              // shuffling to keep things interesting for now
              friends.shuffle();

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: friends.length,
                itemBuilder: (context, index) {
                  final friendData =
                      friends[index].data() as Map<String, dynamic>;
                  final targetUserId =
                      friends[index].id; // User ID of the friend

                  return FriendBox(
                    image: friendData['profileImage'] ?? 'default_image_url',
                    name: friendData['name'] ?? 'Anonymous',
                    follower: friendData['follower'] ?? 'Unknown',
                    targetUserId: targetUserId,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class FriendBox extends StatelessWidget {
  final String image;
  final String name;
  final String follower;
  final String targetUserId;

  const FriendBox({
    Key? key,
    required this.image,
    required this.name,
    required this.follower,
    required this.targetUserId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.all(5),
      width: context.width * 0.40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 2.5,
          color: const Color(0xFFE5E5E5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Avatar(image: image),
          FriendName(name: name),
          const Spacer(),
          FollowButton(
            targetUserId: targetUserId,
            targetUserName: name,
            targetUserProfileImage: image,
          ),
        ],
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  final String image;

  const Avatar({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundImage: NetworkImage(image),
        radius: 22,
      ),
    );
  }
}

class FollowedBy extends StatelessWidget {
  final String name;

  const FollowedBy({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

class FriendName extends StatelessWidget {
  final String name;

  const FriendName({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF4B4B4B),
        fontSize: 17,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class BigTitle extends StatelessWidget {
  final String text;
  const BigTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 15),
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
