// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:words625/core/logger.dart';

// Project imports:
import 'package:words625/di/injection.dart';
import 'package:words625/domain/auth/firebase_user.dart';
import 'package:words625/service/locator.dart';

class AccountAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AccountAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(75);

  @override
  Widget build(BuildContext context) {
    return const AccountWidget();
  }
}

class AccountWidget extends StatelessWidget {
  const AccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, top: 16, right: 12),
      child: PreferenceBuilder<SerializableFirebaseUser?>(
        preference: getIt<AppPrefs>().authUser,
        builder: (BuildContext context, SerializableFirebaseUser? user) {
          // Default values if user is null
          final displayName = user?.displayName ?? 'Guest';
          final email = user?.email ?? 'No email';
          final profileImage =
              user?.photoUrl ?? 'https://example.com/default_avatar.png';

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
              ),
              CircleAvatar(
                radius: 26,
                backgroundImage: NetworkImage(profileImage),
                onBackgroundImageError: (_, __) => const Icon(
                    Icons.account_circle,
                    size: 60,
                    color: Colors.grey),
              ),
            ],
          );
        },
      ),
    );
  }
}
