// Project imports:
import 'package:words625/gen/assets.gen.dart';

List<List<dynamic>> getTeluguData(String firstName) {
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
                "sentence": "Nee peru emiti?",
                "options": [
                  "Na peru $firstName.",
                  "Nenu nerchukuntunnanu.",
                  "Naku teliyadu."
                ],
                "correctAnswer": "Na peru $firstName.",
                "translatedSentence": "My name is $firstName."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Nenu vidyarthini.",
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
                "sentence": "Nenu bhojanam chestunnanu.",
                "options": ["I am eating.", "I am walking.", "I am sitting."],
                "correctAnswer": "I am eating."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Repu vastanu.",
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
                "sentence": "Ela unnaru?",
                "options": ["Bagunnanu.", "Naku teliyadu.", "Na peru Vidya."],
                "correctAnswer": "Bagunnanu.",
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
                "sentence": "Mee ooru ekkada?",
                "options": [
                  "Naa ooru Hyderabad.",
                  "Naku teliyadu.",
                  "Repu vastanu."
                ],
                "correctAnswer": "Naa ooru Hyderabad."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Athanu naa chinnanna.",
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
                "sentence": "Athanu naa peddanna.",
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
                "sentence": "Mee intiki ellipotunnara?",
                "options": [
                  "Nenu intiki veltunnanu.",
                  "Na inti ide.",
                  "Repu vastanu."
                ],
                "correctAnswer": "Nenu intiki veltunnanu."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Naaku Telugu vastundi.",
                "options": [
                  "I know Telugu.",
                  "I speak Telugu fluently.",
                  "I am learning Telugu."
                ],
                "correctAnswer": "I know Telugu."
              },
              {
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Mee coffee kavala?",
                "options": [
                  "Avunu, coffee kavali.",
                  "Kadu, nenu coffee tisukonu.",
                  "Tea kavali."
                ],
                "correctAnswer": "Avunu, coffee kavali."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Naa ammayi ee roju vachindi.",
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
                "sentence": "Meeru English matladutara?",
                "options": [
                  "Avunu, English matladutunnanu.",
                  "Naku artham kavadam ledu.",
                  "Naku teliyadu."
                ],
                "correctAnswer": "Avunu, English matladutunnanu."
              }
            ]
          },
          // Additional levels would be formatted similarly.
        ]
      }
    ]
  ];
}

Map<String, String> teluguDictionary = {
  "Nee": "Your",
  "peru": "name",
  "emi?": "what?",
  "Naa": "My",
  "Nenu": "I",
  "vidyarthi": "student",
  "bhojanam": "food",
  "tinutunnanu": "eating",
  "Repu": "tomorrow",
  "vastanu": "will come",
  "Baagunnava?": "Are you fine?",
  "Baagunnanu": "Fine",
  "Naaku": "I",
  "teliyadu": "don't know",
  "ooru": "place/village",
  "ekkada": "where?",
  "Athan": "He",
  "naa": "my",
  "tammudu": "younger brother",
  "anna": "elder brother",
  "Meeru": "You (polite)",
  "velthunnaru": "going",
  "illaki": "home",
  "ikkada": "here",
  "Telusu": "I know",
  "Coffee": "Coffee",
  "kaavaala?": "want?",
  "Avunu": "Yes",
  "kaavali": "I want",
  "ledu": "No",
  "taganu": "do not drink",
  "Tea": "Tea",
  "Eeroju": "Today",
  "kumarudu": "son",
  "vachadu": "came",
  "English": "English",
  "mataladuthara?": "Do you speak?",
  "mataladanu": "speak",
  "ardham kaaledu": "I don't understand"
};
