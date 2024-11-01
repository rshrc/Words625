// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

// Project imports:
import 'package:words625/di/injection.dart';
import 'package:words625/domain/auth/firebase_user.dart';
import 'package:words625/gen/assets.gen.dart';
import 'package:words625/service/locator.dart';

class AccountAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AccountAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(75);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AccountWidget(),
        Avatar(),
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(
          Assets.images.profilePng.path,
        ),
        radius: 24,
      ),
    );
  }
}

class AccountWidget extends StatelessWidget {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, top: 15),
      child: PreferenceBuilder<SerializableFirebaseUser?>(
        preference: getIt<AppPrefs>().authUser,
        builder: (BuildContext context, SerializableFirebaseUser? user) {
          // Default values if user is null
          final displayName = user?.displayName ?? 'Guest';
          final email = user?.email ?? 'No email';

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  displayName,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4B4B4B),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  email,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFFAFAFAF),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
