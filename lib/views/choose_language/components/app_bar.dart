// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:words625/views/choose_language/components/stage_progress_bar.dart';

class ChooseLanguageAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const ChooseLanguageAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(75);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFAFAFAF),
            size: 32,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
