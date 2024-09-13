// Flutter imports:
import 'package:flutter/material.dart';

class ShopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShopAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 120,
      backgroundColor: Colors.white,
      elevation: 1.5,
      centerTitle: true,
      title: const Text(
        'Shop',
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
      ),
      actions: lingot(1795),
    );
  }

  lingot(int lingot) {
    return [
      Row(
        children: [
          Image.asset(
            'assets/images/lingot.png',
            width: 36,
          ),
          const Padding(
            padding: EdgeInsets.all(2),
          ),
          Text(
            '$lingot',
            style: const TextStyle(
                color: Color(0xFFFF4B4B),
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.all(5),
          ),
        ],
      )
    ];
  }
}
