// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FollowButton extends StatefulWidget {
  final String targetUserId;
  final String targetUserName;
  final String targetUserProfileImage;

  const FollowButton({
    Key? key,
    required this.targetUserId,
    required this.targetUserName,
    required this.targetUserProfileImage,
  }) : super(key: key);

  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool _isFollowing = false;

  @override
  void initState() {
    super.initState();
    _checkIfFollowing();
  }

  Future<void> _checkIfFollowing() async {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;

    if (currentUserId == null) return;

    final followingDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserId)
        .collection('following')
        .doc(widget.targetUserId)
        .get();

    setState(() {
      _isFollowing = followingDoc.exists;
    });
  }

  Future<void> _toggleFollow() async {
    final currentUserId = FirebaseAuth.instance.currentUser?.uid;
    if (currentUserId == null) return;

    final userDoc =
        FirebaseFirestore.instance.collection('users').doc(currentUserId);
    final targetUserDoc =
        FirebaseFirestore.instance.collection('users').doc(widget.targetUserId);

    if (_isFollowing) {
      // Unfollow: Remove from both following and followers collections
      await userDoc.collection('following').doc(widget.targetUserId).delete();
      await targetUserDoc.collection('followers').doc(currentUserId).delete();
      setState(() {
        _isFollowing = false;
      });
    } else {
      // Fetch current user's details from Firestore
      final currentUserSnapshot = await userDoc.get();
      final currentUserData = currentUserSnapshot.data();

      if (currentUserData == null) return;

      // Follow: Add to both following and followers collections
      await userDoc.collection('following').doc(widget.targetUserId).set({
        'name': widget.targetUserName,
        'profileImage': widget.targetUserProfileImage,
        'followedAt': FieldValue.serverTimestamp(),
      });

      await targetUserDoc.collection('followers').doc(currentUserId).set({
        'name': currentUserData['name'] ?? 'Anonymous',
        'profileImage': currentUserData['profileImage'] ?? 'default_image_url',
        'followedAt': FieldValue.serverTimestamp(),
      });

      setState(() {
        _isFollowing = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
      child: ElevatedButton(
        onPressed: _toggleFollow,
        style: ElevatedButton.styleFrom(
          backgroundColor: _isFollowing ? Colors.grey : const Color(0xFF1CB0F6),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          _isFollowing ? 'UNFOLLOW' : 'FOLLOW',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
