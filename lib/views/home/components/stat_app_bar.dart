// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:countup/countup.dart';
import 'package:provider/provider.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

// Project imports:
import 'package:words625/application/game_provider.dart';
import 'package:words625/di/injection.dart';
import 'package:words625/gen/assets.gen.dart';
import 'package:words625/routing/routing.gr.dart';
import 'package:words625/service/locator.dart';
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
      leading: const LanguageSelector(),
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
          stream: context.read<GameProvider>().getUserStreakStream(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loader();
            }
            if (snapshot.hasError) {
              return const Text('Error');
            }

            return Countup(
              begin: 0,
              end: snapshot.data?.toDouble() ?? 0,
              duration: const Duration(milliseconds: 1000),
              separator: ',',
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

class ScoreCard extends StatelessWidget {
  const ScoreCard({super.key});

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
          stream: context.read<GameProvider>().getUserScoreStream(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loader();
            }
            if (snapshot.hasError) {
              return const Text('Error');
            }
            return Countup(
              begin: 0,
              end: snapshot.data?.toDouble() ?? 0,
              duration: const Duration(milliseconds: 1000),
              separator: ',',
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

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferenceBuilder<String>(
      preference: getIt<AppPrefs>().currentLanguage,
      builder: (context, currentLanguage) {
        return GestureDetector(
          onTap: () {
            context.router.push(const LangChoiceRoute());
          },
          child: Container(
            margin: const EdgeInsets.only(left: 15, top: 18, bottom: 18),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.scaleDown,
                image: AssetImage(_getFlagPath(currentLanguage)),
              ),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                width: 2.5,
                color: const Color(0xFFE5E5E5),
              ),
              color: Colors.grey.shade100,
            ),
          ),
        );
      },
    );
  }

  String _getFlagPath(String language) {
    switch (language.toLowerCase()) {
      case 'kannada':
        return Assets.images.karnatakaFlag.path;
      case 'tamil':
        return Assets.images.tamilNaduFlag.path;
      case 'telugu':
        return Assets.images.telenganaFlag.path;
      case 'malayalam':
        return Assets.images.malayalamFlag.path;
      default:
        return Assets.images.karnatakaFlag.path;
    }
  }
}
