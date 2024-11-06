import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

class SocialFriends extends StatelessWidget {
  const SocialFriends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BigTitle(text: 'Friends'),
        Container(
          margin:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          height: 344,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 2.5,
              color: const Color(0xFFE5E5E5),
            ),
          ),
          child: ContainedTabBarView(
            tabBarProperties: const TabBarProperties(
              indicatorColor: Color(0xFF1CB0F6),
              indicatorWeight: 3,
            ),
            tabs: const [
              TabBarText(text: 'FOLLOWING'),
              TabBarText(text: 'FOLLOWERS'),
            ],
            views: [
              PaginatedFollowingList(
                userId: FirebaseAuth.instance.currentUser!.uid,
              ),
              PaginatedFollowersList(
                userId: FirebaseAuth.instance.currentUser!.uid,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BigTitle extends StatelessWidget {
  final String text;

  const BigTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(top: 20, left: 15, bottom: 10),
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

class TabBarText extends StatelessWidget {
  final String text;

  const TabBarText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF777777),
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}

class FollowersList extends StatelessWidget {
  const FollowersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        FriendItem(
            image: 'assets/images/profile.png', name: 'Wanda', xp: '314'),
        FriendItem(
            image: 'assets/images/profile.jpg', name: 'Marc', xp: '2012'),
        FriendItem(
            image: 'assets/images/white.png', name: 'Batman', xp: '10234'),
        FriendItem(image: 'assets/images/cyan.png', name: 'Vinod', xp: '893'),
      ],
    );
  }
}

class FollowingList extends StatelessWidget {
  const FollowingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        FriendItem(
            image: 'assets/images/white.png', name: 'Batman', xp: '10234'),
        FriendItem(image: 'assets/images/cyan.png', name: 'Vinod', xp: '893'),
        FriendItem(
            image: 'assets/images/profile.png', name: 'Wanda', xp: '314'),
        FriendItem(
            image: 'assets/images/profile.jpg', name: 'Marc', xp: '2012'),
      ],
    );
  }
}

class FriendItem extends StatelessWidget {
  final String image;
  final String name;
  final String xp;

  const FriendItem({
    Key? key,
    required this.image,
    required this.name,
    required this.xp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE5E5E5)),
      ),
      child: Row(
        children: [
          Avatar(image: image),
          const Padding(padding: EdgeInsets.all(5)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FriendName(name: name),
              XpAmount(xp: xp),
            ],
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
      margin: const EdgeInsets.all(10),
      child: CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: 22,
      ),
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

class XpAmount extends StatelessWidget {
  final String xp;

  const XpAmount({Key? key, required this.xp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$xp XP',
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Color(0xFFAFAFAF),
      ),
    );
  }
}

class PaginatedFollowersList extends StatefulWidget {
  final String userId;
  const PaginatedFollowersList({Key? key, required this.userId})
      : super(key: key);

  @override
  _PaginatedFollowersListState createState() => _PaginatedFollowersListState();
}

class _PaginatedFollowersListState extends State<PaginatedFollowersList> {
  final ScrollController _scrollController = ScrollController();
  final int _pageSize = 10;
  DocumentSnapshot? _lastDocument;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  List<DocumentSnapshot> _followers = [];

  @override
  void initState() {
    super.initState();
    _fetchFollowers();
    _scrollController.addListener(_onScroll);
  }

  Future<void> _fetchFollowers() async {
    if (_isLoadingMore || !_hasMore) return;

    setState(() => _isLoadingMore = true);

    Query query = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userId)
        .collection('followers')
        .orderBy('followedAt')
        .limit(_pageSize);

    if (_lastDocument != null) {
      query = query.startAfterDocument(_lastDocument!);
    }

    final snapshot = await query.get();
    if (snapshot.docs.isNotEmpty) {
      setState(() {
        _lastDocument = snapshot.docs.last;
        _followers.addAll(snapshot.docs);
        if (snapshot.docs.length < _pageSize) {
          _hasMore = false;
        }
      });
    } else {
      _hasMore = false;
    }
    setState(() => _isLoadingMore = false);
  }

  void _onScroll() {
    if (_scrollController.position.extentAfter < 200) {
      _fetchFollowers();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _followers.length + 1,
      itemBuilder: (context, index) {
        if (index < _followers.length) {
          final followerData = _followers[index].data() as Map<String, dynamic>;
          return FriendItem(
            image: followerData['profileImage'],
            name: followerData['name'],
            xp: 'N/A', // Replace with actual XP if needed
          );
        } else if (_isLoadingMore) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container(); // Empty container at end of list
        }
      },
    );
  }
}

class PaginatedFollowingList extends StatefulWidget {
  final String userId;
  const PaginatedFollowingList({Key? key, required this.userId})
      : super(key: key);

  @override
  _PaginatedFollowingListState createState() => _PaginatedFollowingListState();
}

class _PaginatedFollowingListState extends State<PaginatedFollowingList> {
  final ScrollController _scrollController = ScrollController();
  final int _pageSize = 10;
  DocumentSnapshot? _lastDocument;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  List<DocumentSnapshot> _following = [];

  @override
  void initState() {
    super.initState();
    _fetchFollowing();
    _scrollController.addListener(_onScroll);
  }

  Future<void> _fetchFollowing() async {
    if (_isLoadingMore || !_hasMore) return;

    setState(() => _isLoadingMore = true);

    Query query = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userId)
        .collection('following')
        .orderBy('followedAt')
        .limit(_pageSize);

    if (_lastDocument != null) {
      query = query.startAfterDocument(_lastDocument!);
    }

    final snapshot = await query.get();
    if (snapshot.docs.isNotEmpty) {
      setState(() {
        _lastDocument = snapshot.docs.last;
        _following.addAll(snapshot.docs);
        if (snapshot.docs.length < _pageSize) {
          _hasMore = false;
        }
      });
    } else {
      _hasMore = false;
    }
    setState(() => _isLoadingMore = false);
  }

  void _onScroll() {
    if (_scrollController.position.extentAfter < 200) {
      _fetchFollowing();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _following.length + 1,
      itemBuilder: (context, index) {
        if (index < _following.length) {
          final followingData =
              _following[index].data() as Map<String, dynamic>;
          return FriendItem(
            image: followingData['profileImage'],
            name: followingData['name'],
            xp: 'N/A', // Replace with actual XP if needed
          );
        } else if (_isLoadingMore) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container(); // Empty container at end of list
        }
      },
    );
  }
}
