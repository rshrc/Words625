// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:chiclet/chiclet.dart';

// Project imports:
import 'package:words625/gen/assets.gen.dart';
import 'package:words625/routing/routing.gr.dart';
import 'package:words625/views/auth/components/logout_button.dart';

import 'package:words625/views/profile/widgets/widgets.dart'; // Assuming flutter_gen is being used

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const BigTitle(text: 'Streak'),
        ShopItem(
          imagePath: Assets.images.streakFreeze.path,
          label: 'Streak Freeze',
          description:
              'Protect your streak if you miss a day of practice. Equip up to 2 at once.',
          current: 2,
          total: 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ChicletOutlinedAnimatedButton(
            onPressed: () {
              context.router.push(const MatchWordsRoute());
            },
            backgroundColor: Colors.pinkAccent,
            borderColor: Colors.pink,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Try Match Madness",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        const BigTitle(text: 'Power-Ups'),
        ShopItem(
          imagePath: Assets.images.calendar.path,
          label: 'Double or Nothing',
          description:
              'Attempt to double your five lingot wager by maintaining a seven-day streak.',
          price: 450,
        ),
        const BigTitle(text: 'Outfits'),
        ShopItem(
          imagePath: Assets.images.duo1.path,
          label: 'Formal Attire',
          description:
              "Learn in style. Duo has always been a sharp guy, now he'll look sharp too.",
          price: 1000,
        ),
        ShopItem(
          imagePath: Assets.images.duo2.path,
          label: 'Luxury Tracksuit',
          description:
              'Learn in luxury. Duo will love the feel of 24-carat gold silk on his feathers.',
          price: 2000,
        ),
        ShopItem(
          imagePath: Assets.images.duo3.path,
          label: 'Super Duo',
          description:
              'Transform Duo from a humble owl into a fearless feathered crimefighter.',
          price: 3000,
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: LogoutButton(),
        ),
      ],
    );
  }
}

class ShopItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final String description;
  final int? price;
  final int? current;
  final int? total;

  const ShopItem({
    Key? key,
    required this.imagePath,
    required this.label,
    required this.description,
    this.price,
    this.current,
    this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(5),
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 2.5, color: const Color(0xFFE5E5E5)),
      ),
      child: Row(
        children: [
          ItemImage(imagePath: imagePath),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemLabel(label: label),
                const SizedBox(height: 3),
                ItemDescription(description: description),
                const SizedBox(height: 3),
                price != null
                    ? PriceBox(price: price!)
                    : EquippedBox(current: current!, total: total!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemImage extends StatelessWidget {
  final String imagePath;

  const ItemImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: 110,
    );
  }
}

class ItemLabel extends StatelessWidget {
  final String label;

  const ItemLabel({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF4B4B4B),
        fontSize: 20,
      ),
    );
  }
}

class ItemDescription extends StatelessWidget {
  final String description;

  const ItemDescription({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      child: Text(
        description,
        style: const TextStyle(
          color: Color(0xFF777777),
          fontSize: 15,
        ),
        softWrap: true,
        overflow: TextOverflow.visible,
      ),
    );
  }
}

class PriceBox extends StatelessWidget {
  final int price;

  const PriceBox({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Assets.images.lingot.path, // Using flutter_gen's asset management
          width: 22,
        ),
        const SizedBox(width: 2),
        Text(
          '$price',
          style: const TextStyle(
            color: Color(0xFFFF4B4B),
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class EquippedBox extends StatelessWidget {
  final int current;
  final int total;

  const EquippedBox({Key? key, required this.current, required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        '$current / $total EQUIPPED',
        style: const TextStyle(
          color: Color(0xFF43C000),
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}
