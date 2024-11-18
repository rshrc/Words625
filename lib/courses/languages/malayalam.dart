// Project imports:
import 'package:words625/gen/assets.gen.dart';

List<List<dynamic>> getMalayalamData(String firstName) {
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
                "sentence": "Ninte peru entha?",
                "options": [
                  "Ente peru $firstName.",
                  "Njan padikkunnu.",
                  "Enikku ariyilla."
                ],
                "correctAnswer": "Ente peru $firstName.",
                "translatedSentence": "My name is $firstName."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Njan vidyarthi.",
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
                "sentence": "Njan bhakshanam kazhikkukayanu.",
                "options": ["I am eating.", "I am walking.", "I am sitting."],
                "correctAnswer": "I am eating."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Nale varam.",
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
                "sentence": "Sughamano?",
                "options": ["Sugham.", "Enikku ariyilla.", "Ente peru Vidya."],
                "correctAnswer": "Sugham.",
                "translatedSentence": "I am fine."
              }
            ]
          },
          {
            "level": 2,
            "questions": [
              {
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Ninte ooru evide?",
                "options": [
                  "Ente ooru Kochi.",
                  "Enikku ariyilla.",
                  "Nale varam."
                ],
                "correctAnswer": "Ente ooru Kochi."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Avaan ente anujan.",
                "options": [
                  "He is my friend.",
                  "He is my younger brother.",
                  "He is my cousin."
                ],
                "correctAnswer": "He is my younger brother."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Avaan ente jyeshtan.",
                "options": [
                  "He is my friend.",
                  "He is my elder brother.",
                  "He is my cousin."
                ],
                "correctAnswer": "He is my elder brother."
              },
              {
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Ningal evide pokunnu?",
                "options": [
                  "Njan veettil pokukayanu.",
                  "Ente veedu ita.",
                  "Nale varam."
                ],
                "correctAnswer": "Njan veettil pokukayanu."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Enikku Malayalam ariyam.",
                "options": [
                  "I know Malayalam.",
                  "I speak Malayalam fluently.",
                  "I am learning Malayalam."
                ],
                "correctAnswer": "I know Malayalam."
              },
              {
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Coffee veno?",
                "options": [
                  "Athe, coffee venam.",
                  "Illa, njan coffee kudikkilla.",
                  "Tea venam."
                ],
                "correctAnswer": "Athe, coffee venam."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Enne ente makal innu vannu.",
                "options": [
                  "My daughter came today.",
                  "My wife came today.",
                  "My sister came today."
                ],
                "correctAnswer": "My daughter came today."
              },
              {
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Ningal English samsarikkumo?",
                "options": [
                  "Athe, njan English samsarikkum.",
                  "Enikku manasilakunnilla.",
                  "Enikku ariyilla."
                ],
                "correctAnswer": "Athe, njan English samsarikkum."
              }
            ]
          },
          // Additional levels would be formatted similarly.
        ]
      }
    ]
  ];
}

Map<String, String> malayalamDictionary = {
  "Ninte": "Your",
  "peru": "name",
  "entha?": "what?",
  "Ente": "My",
  "Njan": "I",
  "vidyarthi": "student",
  "bhakshanam": "food",
  "kazhikkukayanu": "eating",
  "Nale": "tomorrow",
  "varam": "will come",
  "Sughamano?": "Are you fine?",
  "Sugham": "Fine",
  "Enikku": "I",
  "ariyilla": "don't know",
  "ooru": "place/village",
  "evide": "where?",
  "Avaan": "He",
  "ente": "my",
  "anujan": "younger brother",
  "jyeshtan": "elder brother",
  "Ningal": "You (polite)",
  "pokkunnu": "going",
  "veettil": "home",
  "ita": "here",
  "Ariyam": "I know",
  "Coffee": "Coffee",
  "veno?": "want?",
  "Athe": "Yes",
  "venam": "I want",
  "illa": "No",
  "kudikkilla": "do not drink",
  "Tea": "Tea",
  "Enne": "Today",
  "makal": "daughter",
  "vannu": "came",
  "English": "English",
  "samsarikkumo?": "Do you speak?",
  "samsarikkum": "speak",
  "manasilakunnilla": "I don't understand"
};
