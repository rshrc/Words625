// Project imports:
import 'package:words625/domain/course/course.dart';
import 'package:words625/gen/assets.gen.dart';

final coursesData = [
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
              "sentence": "Ninna hesaru yenu?",
              "options": [
                "Nanna hesaru Rishi.",
                "Naanu kaalithini.",
                "Naanu gothilla."
              ],
              "correctAnswer": "Nanna hesaru Rishi."
            },
            {
              "type": "translate",
              "prompt": "Translate the sentence",
              "sentence": "Naanu vidyaarthi.",
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
              "sentence": "Naanu oota maaduthiddene.",
              "options": ["I am eating.", "I am walking.", "I am sitting."],
              "correctAnswer": "I am eating."
            },
            {
              "type": "translate",
              "prompt": "Translate the sentence",
              "sentence": "Naale barthini.",
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
              "question": "Hege iddeera?",
              "options": [
                "Chennagiddini.",
                "Naanu gothilla.",
                "Nanna hesaru Vidya."
              ],
              "correctAnswer": "Chennagiddini."
            }
          ]
        },
        {
          "level": 2,
          "questions": [
            {
              "type": "translate",
              "prompt": "Translate the sentence",
              "sentence": "Namaskaara.",
              "options": ["Hello.", "My name is Rishi", "What is your name?"],
              "correctAnswer": "Hello."
            },
            {
              "type": "translate",
              "prompt": "Translate the sentence",
              "sentence": "Naanu Bengaluru-ge hoguthiddene.",
              "options": [
                "I am going to Bangalore.",
                "I am coming from Bangalore.",
                "I live in Bangalore."
              ],
              "correctAnswer": "I am going to Bangalore."
            },
            {
              "type": "multiple_choice",
              "prompt": "Choose an appropriate response",
              "question": "Yelli hoguthiddene?",
              "options": [
                "Bengalurige hoguthiddene.",
                "Chennai-ge barthini.",
                "Naale barthini."
              ],
              "correctAnswer": "Bengalurige hoguthiddene."
            },
            {
              "type": "translate",
              "prompt": "Translate the sentence",
              "sentence": "Naanu vidyaarthi.",
              "options": [
                "I am a student.",
                "You are a teacher.",
                "They are students."
              ],
              "correctAnswer": "I am a student."
            },
            {
              "type": "multiple_choice",
              "prompt": "Choose the correct option",
              "question": "What is the Kannada word for 'water'?",
              "options": ["Neeru", "Hannu", "BaaLa"],
              "correctAnswer": "Neeru"
            }
          ]
        },
        {
          "level": 3,
          "questions": [
            {
              "type": "translate",
              "prompt": "Translate the sentence",
              "sentence": "Ninna hesaru yenu?",
              "options": [
                "What is your name?",
                "How are you?",
                "Where are you going?"
              ],
              "correctAnswer": "What is your name?"
            },
            {
              "type": "multiple_choice",
              "prompt": "Choose the correct response",
              "question": "How do you say 'Good morning' in Kannada?",
              "options": ["Shubhodaya", "Namaskaara", "Hege iddeera"],
              "correctAnswer": "Shubhodaya"
            },
            {
              "type": "translate",
              "prompt": "Translate the sentence",
              "sentence": "Naanu Bengaluru-dalli iddene.",
              "options": [
                "I am in Bangalore.",
                "I am from Bangalore.",
                "I am going to Bangalore."
              ],
              "correctAnswer": "I am in Bangalore."
            },
            {
              "type": "translate",
              "prompt": "Translate the sentence",
              "sentence": "Ninna mane ellide?",
              "options": [
                "Where is your house?",
                "Where are you?",
                "Where is your school?"
              ],
              "correctAnswer": "Where is your house?"
            },
            {
              "type": "multiple_choice",
              "prompt": "Choose the correct option",
              "question": "Which one is correct?",
              "options": [
                "Naanu oota maaduthiddene.",
                "Naale oota maaduthiddene.",
                "Nanna hesaru oota."
              ],
              "correctAnswer": "Naanu oota maaduthiddene."
            }
          ]
        },
        {
          "level": 4,
          "questions": [
            {
              "type": "translate",
              "prompt": "Translate the sentence",
              "sentence": "Naanu pustaka ooduthiddene.",
              "options": [
                "I am reading a book.",
                "I am writing a book.",
                "I am buying a book."
              ],
              "correctAnswer": "I am reading a book."
            },
            {
              "type": "multiple_choice",
              "prompt": "Choose the correct response",
              "question": "How do you say 'Good night' in Kannada?",
              "options": ["Shubha raatri", "Shubhodaya", "Chennagiddini"],
              "correctAnswer": "Shubha raatri"
            },
            {
              "type": "translate",
              "prompt": "Translate the sentence",
              "sentence": "Bengalurige barthini.",
              "options": [
                "I am coming to Bangalore.",
                "I am going to Bangalore.",
                "I live in Bangalore."
              ],
              "correctAnswer": "I am coming to Bangalore."
            },
            {
              "type": "translate",
              "prompt": "Translate the sentence",
              "sentence": "Ninna tande hesaru yenu?",
              "options": [
                "What is your father's name?",
                "What is your mother's name?",
                "What is your name?"
              ],
              "correctAnswer": "What is your father's name?"
            },
            {
              "type": "multiple_choice",
              "prompt": "Choose the correct answer",
              "question": "Which one is correct?",
              "options": [
                "Chennagiddini",
                "Ninna mane ellide?",
                "Naale barthini."
              ],
              "correctAnswer": "Chennagiddini"
            }
          ]
        },
        {
          "level": 5,
          "questions": [
            {
              "type": "translate",
              "prompt": "Translate the sentence",
              "sentence": "Nanna hesaru Rishi.",
              "options": [
                "My name is Rishi.",
                "Your name is Rishi.",
                "His name is Rishi."
              ],
              "correctAnswer": "My name is Rishi."
            },
            {
              "type": "multiple_choice",
              "prompt": "Choose the correct response",
              "question": "What is the Kannada word for 'school'?",
              "options": ["Shaale", "Neeru", "Bengaluru"],
              "correctAnswer": "Shaale"
            },
            {
              "type": "translate",
              "prompt": "Translate the sentence",
              "sentence": "Naanu hathu varsha praya iddene.",
              "options": [
                "I am ten years old.",
                "I am twenty years old.",
                "I am five years old."
              ],
              "correctAnswer": "I am ten years old."
            },
            {
              "type": "translate",
              "prompt": "Translate the sentence",
              "sentence": "Vidyaarthi pustaka oodutthidaane.",
              "options": [
                "The student is reading a book.",
                "The student is writing a book.",
                "The student is buying a book."
              ],
              "correctAnswer": "The student is reading a book."
            },
            {
              "type": "multiple_choice",
              "prompt": "Choose the correct option",
              "question": "Which of these means 'I am learning Kannada'?",
              "options": [
                "Naanu Kannada kalithu kolluthiddene.",
                "Naanu Kannada gothilla.",
                "Naanu Kannada oduthiddene."
              ],
              "correctAnswer": "Naanu Kannada kalithu kolluthiddene."
            }
          ]
        }
      ]
    }
  ],
  [
    {
      "courseName": "greetings",
      "image": Assets.images.hand.path,
      "color": 0xffFFD700,
      "levels": [
        {
          "level": 1,
          "questions": [
            {
              "type": "translate",
              "prompt": "Translate the sentence",
              "sentence": "Namaskaara.",
              "options": ["Hello.", "Goodbye.", "Good night."],
              "correctAnswer": "Hello."
            },
            {
              "type": "multiple_choice",
              "prompt": "Choose an appropriate response",
              "question": "Ninna hesaru yenu?",
              "options": [
                "Nanna hesaru Rishi.",
                "Naanu kaalithini.",
                "Naanu gothilla."
              ],
              "correctAnswer": "Nanna hesaru Rishi."
            },
            {
              "type": "translate",
              "prompt": "Translate the sentence",
              "sentence": "Naanu Bengaluru-ge hoguthiddene.",
              "options": [
                "I am going to Bangalore.",
                "I am coming from Bangalore.",
                "I live in Bangalore."
              ],
              "correctAnswer": "I am going to Bangalore."
            },
            {
              "type": "translate",
              "prompt": "Translate the sentence",
              "sentence": "Vidhaaya.",
              "options": ["I am fine.", "Goodbye.", "Good night."],
              "correctAnswer": "I am fine."
            },
            {
              "type": "translate",
              "prompt": "Translate the sentence",
              "sentence": "Naanu Kannada kalithu kolluthiddene.",
              "options": [
                "I am learning Kannada.",
                "I speak Kannada fluently.",
                "I don't know Kannada."
              ],
              "correctAnswer": "I am learning Kannada."
            }
          ]
        },
        {
          "level": 2,
          "questions": [
            {
              "type": "translate",
              "prompt": "Translate the sentence",
              "sentence": "Namaskaara.",
              "options": ["Hello.", "Goodbye.", "Good night."],
              "correctAnswer": "Hello."
            },
            {
              "type": "multiple_choice",
              "prompt": "Choose an appropriate response",
              "question": "Ninna hesaru yenu?",
              "options": [
                "Nanna hesaru Rishi.",
                "Naanu kaalithini.",
                "Naanu gothilla."
              ],
              "correctAnswer": "Nanna hesaru Rishi."
            },
          ]
        },
      ]
    },
    {
      "courseName": "introduction",
      "image": Assets.images.pen.path,
      "color": 0xffCE82FF,
    },
  ],
  [
    {
      "courseName": "animals",
      "image": Assets.images.fish.path,
      "color": 0xffFFA500,
    },
    {
      "courseName": "colors",
      "image": Assets.images.bucket.path,
      "color": 0xffFF0000,
    },
  ],
  [
    {
      "courseName": "sentence",
      "image": Assets.images.bandages.path,
      "color": 0xff00FF00,
    },
  ],
  [
    {
      "courseName": "clothing",
      "image": Assets.images.heel.path,
      "color": 0xffFFD700,
    },
    {
      "courseName": "tools",
      "image": Assets.images.hammer.path,
      "color": 0xff808080,
    },
    {
      "courseName": "emotions",
      "image": Assets.images.emotion.path,
      "color": 0xff0000FF,
    },
  ],
  [
    {
      "courseName": "daily",
      "image": Assets.images.dumbbell.path,
      "color": 0xff2b70c9,
    },
    {
      "courseName": "travel",
      "image": Assets.images.tree.path,
      "color": 0xffFF0000,
    },
  ]
];

List<List<Course>> parseCourses() {
  return coursesData.map((courseGroup) {
    return courseGroup.map((courseMap) => Course.fromJson(courseMap)).toList();
  }).toList();
}
