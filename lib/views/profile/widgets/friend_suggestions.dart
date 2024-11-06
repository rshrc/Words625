import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:words625/core/extensions.dart';

class FriendSuggestions extends StatelessWidget {
  const FriendSuggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BigTitle(),
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

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: friends.length,
                itemBuilder: (context, index) {
                  final friend = friends[index].data() as Map<String, dynamic>;
                  return FriendBox(
                    image: friend['profileImage'] ?? 'default_image_url',
                    name: friend['name'] ?? 'Anonymous',
                    follower: friend['follower'] ?? 'Unknown',
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

  const FriendBox({
    Key? key,
    required this.image,
    required this.name,
    required this.follower,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Avatar(image: image),
          FriendName(name: name),
          const Spacer(),
          const FollowButton(),
        ],
      ),
    );
  }
}

class FollowButton extends StatelessWidget {
  const FollowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30,
      margin: const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
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

class BigTitle extends StatelessWidget {
  const BigTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
