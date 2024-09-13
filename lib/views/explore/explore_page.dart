// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:words625/views/lesson/lesson_screen.dart';

// Project imports:

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const Padding(padding: EdgeInsets.only(bottom: 5)),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LessonPage(),
              ),
            );
          },
          child: newsBox(
              'assets/images/news-1.png',
              'Stop! Grammar time!',
              'We have a few tricks up our sleeves for practicing grammar rules and patterns.',
              'May 19'),
        ),
        newsBox(
            'assets/images/news-2.png',
            'words625 ABC is now available!',
            'Learn more about the app that helps your child learn-and love!-to read.',
            'May 17'),
        newsBox(
            'assets/images/news-3.png',
            'What\'s it like to work at words625?',
            'We asked one of our engineers to share a little bit about her experience. Check it out!',
            'May 12'),
        newsBox(
            'assets/images/news-4.png',
            'Repeat after me',
            'Or at least try these pronunciation tips for learning the sounds of your new language.',
            'May 11'),
        newsBox(
          'assets/images/news-5.png',
          'What\'s the most popular language among Gen Z',
          'We looked at the data to see what languages different generations tend to study, and we noticed a few cool trends.',
          'May 2',
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15),
        )
      ],
    );
  }

  newsBox(String image, String title, String description, String date) {
    return Container(
      // height: 100,
      margin: const EdgeInsets.only(bottom: 5, top: 15, left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 2.5,
          color: const Color(0xFFE5E5E5),
        ),
      ),
      child: Column(
        children: [
          imageBox(image),
          newsTitle(title),
          newsDescription(description),
          newsDate(date),
        ],
      ),
    );
  }

  newsDate(String date) {
    return Container(
      margin: const EdgeInsets.only(left: 15, bottom: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          date,
          style: const TextStyle(
            fontSize: 15,
            // fontWeight: FontWeight.bold,
            color: Color(0xFFAFAFAF),
          ),
        ),
      ),
    );
  }

  newsDescription(String description) {
    return Container(
      margin: const EdgeInsets.only(left: 15, bottom: 10),
      child: Text(
        description,
        style: const TextStyle(
          fontSize: 17,
          // fontWeight: FontWeight.bold,
          color: Color(0xFF777777),
        ),
      ),
    );
  }

  newsTitle(String title) {
    return Container(
      margin: const EdgeInsets.only(left: 15, bottom: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF4B4B4B),
          ),
        ),
      ),
    );
  }

  imageBox(String image) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 15, right: 15, left: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 2.5,
          color: const Color(0xFFE5E5E5),
        ),
      ),
      child: Image.asset(
        image,
        height: 150,
        width: double.infinity,
      ),
    );
  }
}
