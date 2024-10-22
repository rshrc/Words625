// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:chiclet/chiclet.dart';

// Project imports:
import 'package:words625/routing/routing.gr.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        bigTitle('Streak'),
        item(
          'assets/images/streak-freeze.png',
          'Streak Freeze',
          'Protect your streak if you miss a day'
              ' of practice. Equip up to 2 at once.',
          null,
          2,
          2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: ChicletOutlinedAnimatedButton(
            onPressed: () {
              context.router.push(MatchWordsRoute());
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
                )
              ],
            ),
          ),
        ),
        bigTitle('Power-Ups'),
        item(
            'assets/images/calendar.png',
            'Double or Nothing',
            'Attempt to double your five lingot wager by maintaining a seven day streak.',
            450,
            null,
            null),
        bigTitle('Outfits'),
        item(
            'assets/images/duo-1.png',
            'Formal Attire',
            'Learn in style. Duo has always been a sharp guy, now he\'ll look sharp too.',
            1000,
            null,
            null),
        item(
            'assets/images/duo-2.png',
            'Luxury Tracksuit',
            'Learn in luxury. Duo will love the feel of 24 carat gold silk on his feathers.',
            2000,
            null,
            null),
        item(
            'assets/images/duo-3.png',
            'Super Duo',
            'Transform Duo from a humble owl into a fearless feathered crimefighter.',
            3000,
            null,
            null),
      ],
    );
  }

  item(String image, String label, String description, int? price, int? current,
      int? total) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      padding: const EdgeInsets.all(5),
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 2.5,
          color: const Color(0xFFE5E5E5),
        ),
      ),
      child: Row(
        children: [
          itemImage(image),
          const Padding(padding: EdgeInsets.all(5)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              itemLabel(label),
              const Padding(padding: EdgeInsets.all(3)),
              itemDescription(description),
              const Padding(padding: EdgeInsets.all(3)),
              price != null ? priceBox(price) : equippedBox(current!, total!),
            ],
          )
        ],
      ),
    );
  }

  equippedBox(int current, int total) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.green.shade50, borderRadius: BorderRadius.circular(5)),
      child: Text(
        '$current / $total EQUIPPED',
        style: const TextStyle(
            color: Color(0xFF43C000),
            fontWeight: FontWeight.bold,
            fontSize: 15),
      ),
    );
  }

  priceBox(int price) {
    return Row(
      children: [
        Image.asset(
          'assets/images/lingot.png',
          width: 22,
        ),
        const Padding(
          padding: EdgeInsets.all(2),
        ),
        Text(
          '$price',
          style: const TextStyle(
              color: Color(0xFFFF4B4B),
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
        const Padding(
          padding: EdgeInsets.all(5),
        ),
      ],
    );
  }

  itemDescription(String name) {
    return SizedBox(
      width: 210,
      child: Text(
        name,
        style: const TextStyle(
          color: Color(0xFF777777),
          fontSize: 15,
        ),
        softWrap: true,
        overflow: TextOverflow.visible,
      ),
    );
  }

  itemLabel(String name) {
    return Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF4B4B4B),
        fontSize: 20,
      ),
    );
  }

  itemImage(String image) {
    return Image.asset(
      image,
      width: 110,
    );
  }

  bigTitle(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, bottom: 10),
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
