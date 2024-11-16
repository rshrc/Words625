// Project imports:
import 'package:words625/gen/assets.gen.dart';

List<List<dynamic>> getTamilData(String firstName) {
  return [
    [
      {
        "courseName": "basics",
        "image": Assets.images.egg.path,
        "color": 0xff2b70c9,
        "levels": [
          {
            "level": 1,
            "questions": [
              {
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Un peyar enna?",
                "options": [
                  "En peyar $firstName.",
                  "Naan kattrukkondirukkiren.",
                  "Enakku theriyathu."
                ],
                "correctAnswer": "En peyar $firstName.",
                "translatedSentence": "My name is $firstName"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Naan oru maanavan.",
                "options": [
                  "I am a student.",
                  "You are a student.",
                  "They are students."
                ],
                "correctAnswer": "I am a student."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Naan saappidugiren.",
                "options": ["I am eating.", "I am walking.", "I am sitting."],
                "correctAnswer": "I am eating."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Naan naalai varuven.",
                "options": [
                  "I will come tomorrow.",
                  "I am going now.",
                  "I will not come."
                ],
                "correctAnswer": "I will come tomorrow."
              },
              {
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Nee eppadi irukkirai?",
                "options": [
                  "Naan nandraga irukkiren.",
                  "Enakku theriyathu.",
                  "En peyar Vidya."
                ],
                "correctAnswer": "Naan nandraga irukkiren.",
                "translatedSentence": "I am fine"
              }
            ]
          },
          // Additional levels and their translations would follow the same pattern
        ]
      }
    ],
    // Additional courses would be structured similarly with transliterated Tamil phrases
  ];
}
