// Project imports:
import 'package:words625/domain/course/course.dart';
import 'package:words625/gen/assets.gen.dart';

Future<List<List<dynamic>>> getCoursesData({required String firstName}) async {
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
                "sentence": "Ninna hesaru enu?",
                "options": [
                  "Nanna hesaru $firstName.",
                  "Naanu kalithini.",
                  "Nange gothilla."
                ],
                "correctAnswer": "Nanna hesaru $firstName."
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
                "sentence": "Hege iddeera?",
                "options": [
                  "Chennagiddini.",
                  "Nange gothilla.",
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
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Ninna ooru yavudu?",
                "options": [
                  "Nanna ooru Bengaluru.",
                  "Nange gothilla.",
                  "Naale barthini."
                ],
                "correctAnswer": "Nanna ooru Bengaluru."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Avanu nanna thamma.",
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
                "sentence": "Avanu nanna anna.",
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
                "sentence": "Neevu yelli hoguthiddira?",
                "options": [
                  "Naanu manege hoguthiddene.",
                  "Nanna mane adhu.",
                  "Naale barthini."
                ],
                "correctAnswer": "Naanu manege hoguthiddene."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Nanage Kannada baruthe.",
                "options": [
                  "I know Kannada.",
                  "I speak Kannada fluently.",
                  "I am learning Kannada."
                ],
                "correctAnswer": "I know Kannada."
              },
              {
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Nimage coffee beka?",
                "options": [
                  "Yes, I would like coffee.",
                  "No, I don't drink coffee.",
                  "I like tea."
                ],
                "correctAnswer": "Yes, I would like coffee."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Ivattu nanna magaLu bandaLu.",
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
                "sentence": "Neevu English maathaduttheera?",
                "options": [
                  "Yes, I speak English.",
                  "I don't understand.",
                  "I don't know."
                ],
                "correctAnswer": "Yes, I speak English."
              }
            ]
          },
          {
            "level": 3,
            "questions": [
              {
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Ninna thindi aytha?",
                "options": [
                  "Howdu, aythu.",
                  "Beda, beku.",
                  "Naale thintheeni."
                ],
                "correctAnswer": "Howdu, aythu."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Avanu nanna snehitha.",
                "options": [
                  "He is my friend.",
                  "He is my teacher.",
                  "He is my neighbor."
                ],
                "correctAnswer": "He is my friend."
              },
              {
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Yelli odutthaidya?",
                "options": [
                  "Naanu Bengaluralli oduttha iddhini.",
                  "Naanu nanna mane hatra iddini.",
                  "Naanu channagiddini."
                ],
                "correctAnswer": "Naanu Bengaluralli odutha iddini."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Naanu manege hoguthiddene.",
                "options": [
                  "I am going home.",
                  "I am cooking at home.",
                  "I am playing outside."
                ],
                "correctAnswer": "I am going home."
              },
              {
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Nimma vayassu eshtu?",
                "options": [
                  "Nange hadinayidu varsha aagidhe.",
                  "Naanu oota maaduthiddene.",
                  "Naanu Bengaluru hodha."
                ],
                "correctAnswer": "Nange hadinayidu varsha aagidhe"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Avalu nanna akka.",
                "options": [
                  "She is my elder sister.",
                  "She is my mother.",
                  "She is my teacher."
                ],
                "correctAnswer": "She is my elder sister."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Avalu nanna thangi.",
                "options": [
                  "She is my younger sister.",
                  "She is my mother.",
                  "She is my teacher."
                ],
                "correctAnswer": "She is my younger sister."
              },
              {
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Nimage nanna sahaya beka?",
                "options": [
                  "Yes, I need help.",
                  "No, I am okay.",
                  "I am going home."
                ],
                "correctAnswer": "Yes, I need help."
              }
            ]
          },
          {
            "level": 4,
            "questions": [
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Naanu pustaka oodutthaidhini.",
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
                "sentence": "How do you say 'Good night' in Kannada?",
                "options": ["Shubha raatri", "Shubhodaya", "Chennagiddini"],
                "correctAnswer": "Shubha raatri"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Bengalurige barthini.",
                "options": [
                  "I will come to Bangalore.",
                  "I am going to Bangalore.",
                  "I live in Bangalore."
                ],
                "correctAnswer": "I will come to Bangalore."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Ninna thandeyavara hesaru enu?",
                "options": [
                  "What is your father's name?",
                  "What is your mother's name?",
                  "What is your name?"
                ],
                "correctAnswer": "What is your father's name?"
              },
              {
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Hengiddhira",
                "options": [
                  "Chennagiddhini",
                  "Ninna mane ellide?",
                  "Naale barthini.",
                ],
                "correctAnswer": "Chennagiddhini"
              }
            ]
          },
          {
            "level": 5,
            "questions": [
              {
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Neevu enu maadthira?",
                "options": [
                  "Naanu engineer.",
                  "Naanu gothilla.",
                  "Naale barthini."
                ],
                "correctAnswer": "Naanu engineer."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Nanna magalu hathra ide.",
                "options": [
                  "My daughter is nearby.",
                  "My son is in school.",
                  "My wife is at home."
                ],
                "correctAnswer": "My daughter is nearby."
              },
              {
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Yavaga nillu?",
                "options": [
                  "Naale.",
                  "Innu swalpa samaya.",
                  "I will eat later."
                ],
                "correctAnswer": "Innu swalpa samaya."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Namma mane sundara.",
                "options": [
                  "Our house is beautiful.",
                  "Our car is new.",
                  "Our garden is large."
                ],
                "correctAnswer": "Our house is beautiful."
              },
              {
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Ninna jeevanadalli yaaru mukhya?",
                "options": [
                  "Nanna family mukhya.",
                  "Nanna mane doora.",
                  "Nanna huduga hattira."
                ],
                "correctAnswer": "Nanna family mukhya."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Avanu Bengaluru vidhyarthi.",
                "options": [
                  "He is a student from Bengaluru.",
                  "He is working in Bengaluru.",
                  "He is visiting Bengaluru."
                ],
                "correctAnswer": "He is a student from Bengaluru."
              },
              {
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Nimma mane yalli ide?",
                "options": [
                  "Namma mane Bengaluralli ide.",
                  "Nanna hesaru $firstName.",
                  "Naanu odutha iddini."
                ],
                "correctAnswer": "Namma mane Bengaluralli ide."
              }
            ]
          },
          {
            "level": 6,
            "questions": [
              {
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Yelli hogthiddheera?",
                "options": [
                  "Naanu marketge hogthiddhini.",
                  "Naanu eshtu vayassu.",
                  "Nanna hesaru geetegaara."
                ],
                "correctAnswer": "Naanu marketge hogthiddhini."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Nanna makkalu nanna hemme.",
                "options": [
                  "My children are my pride.",
                  "My family is my pride.",
                  "My job is my pride."
                ],
                "correctAnswer": "My children are my pride."
              },
              {
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Nimage yaava ruchi ishta?",
                "options": [
                  "Nanage masala dosa ishta.",
                  "Nanage Kannada gothilla.",
                  "Nanage coffee beku."
                ],
                "correctAnswer": "Nanage masala dosa ishta."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Ivattu nanna dina uttama.",
                "options": [
                  "Today is my best day.",
                  "Tomorrow will be a good day.",
                  "Yesterday was a great day."
                ],
                "correctAnswer": "Today is my best day."
              },
              {
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Ninna uddesha enu?",
                "options": [
                  "Nanna uddesha kushiyagi jeevana maduvudu.",
                  "Naanu odutha iddini.",
                  "Nanna mane Bengaluru."
                ],
                "correctAnswer": "Nanna uddesha kushiyagi jeevana maduvudu."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Naanu avarannu manege karide.",
                "options": [
                  "I invited them home.",
                  "I called her.",
                  "I asked him."
                ],
                "correctAnswer": "I invited them home."
              },
              {
                "type": "multiple_choice",
                "prompt": "Choose an appropriate response",
                "sentence": "Neevu yaake oodtheera?",
                "options": [
                  "I like reading books.",
                  "I don’t like running.",
                  "I love to sing."
                ],
                "correctAnswer": "I like reading books."
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
                "type": "multiple_choice",
                "prompt": "Choose the correct greeting",
                "sentence": "How do you say 'Hello' in Kannada?",
                "options": [
                  "Namaskara",
                  "Dhanyavaadagalu",
                  "Ninna hesaru enu?"
                ],
                "correctAnswer": "Namaskara"
              },
              {
                "type": "translate",
                "prompt": "Translate the greeting",
                "sentence": "Namaskara",
                "options": ["Hello", "Goodbye", "Thank you"],
                "correctAnswer": "Hello"
              },
              {
                "type": "multiple_choice",
                "prompt": "Choose the appropriate response",
                "sentence": "How do you ask 'How are you?' in Kannada?",
                "options": [
                  "Hege iddheera?",
                  "Ninna hesaru enu?",
                  "Oota aaytha?"
                ],
                "correctAnswer": "Hege iddheera?"
              },
              {
                "type": "translate",
                "prompt": "Translate the phrase",
                "sentence": "Chennagiddini",
                "options": ["I am good", "I am tired", "I am happy"],
                "correctAnswer": "I am good"
              },
              {
                "type": "multiple_choice",
                "prompt": "Choose the appropriate greeting for the evening",
                "sentence": "How do you greet someone in the evening?",
                "options": [
                  "Shubha Saayankaala",
                  "Shubha Madyahna",
                  "Shubha Beligge"
                ],
                "correctAnswer": "Shubha Saayankaala"
              }
            ]
          },
          {
            "level": 2,
            "questions": [
              {
                "type": "multiple_choice",
                "prompt": "Choose the correct way to say 'Goodbye' in Kannada",
                "sentence": "How do you say 'Goodbye'?",
                "options": ["Naanu bandhe", "Hogbarthini", "Namaskara"],
                "correctAnswer": "Hogbarthini"
              },
              {
                "type": "translate",
                "prompt": "Translate the greeting",
                "sentence": "Shubha Beligge",
                "options": ["Good morning", "Good night", "Good evening"],
                "correctAnswer": "Good morning"
              },
              {
                "type": "multiple_choice",
                "prompt": "Choose the appropriate response",
                "sentence": "How do you say 'Good night' in Kannada?",
                "options": [
                  "Shubha Rathri",
                  "Shubha Madyahna",
                  "Shubha Saayankaala"
                ],
                "correctAnswer": "Shubha Rathri"
              },
              {
                "type": "translate",
                "prompt": "Translate the phrase",
                "sentence": "Oota aaytha?",
                "options": ["Did you eat?", "How are you?", "Where are you?"],
                "correctAnswer": "Did you eat?"
              },
              {
                "type": "multiple_choice",
                "prompt": "Choose the correct translation",
                "sentence": "How do you ask someone to 'come in' politely?",
                "options": ["Banni", "Nodi", "Hogi"],
                "correctAnswer": "Banni"
              }
            ]
          }
        ]
      },
      {
        "courseName": "introduction",
        "image": Assets.images.pen.path,
        "color": 0xffCE82FF,
        "levels": []
      },
    ],
    [
      {
        "courseName": "animals",
        "image": Assets.images.fish.path,
        "color": 0xffFFA500,
        "levels": [
          {
            "level": 1,
            "questions": [
              {
                "type": "multiple_choice",
                "prompt": "Translate the animal name",
                "sentence": "Dog",
                "options": ["Naayi", "Koli", "Aane"],
                "correctAnswer": "Naayi"
              },
              {
                "type": "translate",
                "prompt": "Translate the animal name",
                "sentence": "Bekku",
                "options": ["Cat", "Cow", "Elephant"],
                "correctAnswer": "Cat"
              },
              {
                "type": "multiple_choice",
                "prompt": "Translate the animal name",
                "sentence": "Elephant",
                "options": ["Aane", "Kuri", "Huli"],
                "correctAnswer": "Aane"
              },
              {
                "type": "translate",
                "prompt": "Translate the animal name",
                "sentence": "Huli",
                "options": ["Tiger", "Lion", "Deer"],
                "correctAnswer": "Tiger"
              },
              {
                "type": "multiple_choice",
                "prompt": "Translate the animal name",
                "sentence": "Cow",
                "options": ["Hasu", "Koli", "Bekku"],
                "correctAnswer": "Hasu"
              }
            ]
          }
        ]
      },
      {
        "courseName": "colors",
        "image": Assets.images.bucket.path,
        "color": 0xffFF0000,
        "levels": [
          {
            "level": 1,
            "questions": [
              {
                "type": "multiple_choice",
                "prompt": "Translate the color name",
                "sentence": "Red",
                "options": ["Kempu", "Neeli", "Hasiru"],
                "correctAnswer": "Kempu"
              },
              {
                "type": "translate",
                "prompt": "Translate the color name",
                "sentence": "Neeli",
                "options": ["Blue", "Yellow", "Green"],
                "correctAnswer": "Blue"
              },
              {
                "type": "multiple_choice",
                "prompt": "Translate the color name",
                "sentence": "Green",
                "options": ["Hasiru", "Bili", "Kappu"],
                "correctAnswer": "Hasiru"
              },
              {
                "type": "translate",
                "prompt": "Translate the color name",
                "sentence": "Bili",
                "options": ["White", "Black", "Orange"],
                "correctAnswer": "White"
              },
              {
                "type": "multiple_choice",
                "prompt": "Translate the color name",
                "sentence": "Black",
                "options": ["Kappu", "Kempu", "Hasiru"],
                "correctAnswer": "Kappu"
              }
            ]
          }
        ]
      },
    ],
    [
      {
        "courseName": "life in BLR",
        "image": Assets.images.bandages.path,
        "color": 0xff00FF00,
        "levels": [
          {
            "level": 1,
            "questions": [
              {
                "type": "multiple_choice",
                "prompt": "How do you ask 'Where are you?' to the auto driver?",
                "sentence": "What is the Kannada phrase for 'Where are you?'",
                "options": [
                  "Neevu elli iddheera?",
                  "Neenu yelli hogthiddiya?",
                  "Naale barthini."
                ],
                "correctAnswer": "Neevu elli iddheera?"
              },
              {
                "type": "multiple_choice",
                "prompt":
                    "How do you ask the auto driver to come to your location?",
                "sentence":
                    "What is the Kannada phrase for 'Come to my location'?",
                "options": [
                  "Nanna location-ge banni",
                  "Nanna hesaru gothide.",
                  "Oota maadi."
                ],
                "correctAnswer": "Nanna location-ge banni"
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask for the fare in Kannada?",
                "sentence":
                    "What is the Kannada phrase for 'How much for the ride?'",
                "options": ["Eshtu aaithu?", "Elli hogbeku?", "Hege iddeera?"],
                "correctAnswer": "Eshtu aaithu?"
              },
              {
                "type": "translate",
                "prompt": "Translate this sentence",
                "sentence": "Swalpa kammi maadi.",
                "options": [
                  "Reduce the price a little.",
                  "Let's go faster.",
                  "I am in a hurry."
                ],
                "correctAnswer": "Reduce the price a little."
              },
              {
                "type": "multiple_choice",
                "prompt": "Choose the correct response",
                "sentence": "How do you say 'I want to go to Majestic'?",
                "options": [
                  "Naanu Majestic ge hogabeku.",
                  "Nanna hesaru Majestic.",
                  "Nanu gothilla."
                ],
                "correctAnswer": "Naanu Majestic ge hogabeku."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Meter mele hogona.",
                "options": [
                  "Let’s go by the meter.",
                  "Drive faster.",
                  "Stop the auto here."
                ],
                "correctAnswer": "Let’s go by the meter."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask if the driver has change?",
                "sentence": "How do you say 'Do you have change?' in Kannada?",
                "options": [
                  "Nimhathra change idhya?",
                  "Nimage time idhya?",
                  "Nimma oota aytha?"
                ],
                "correctAnswer": "Nimhathra change idhya?"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Eshtu hotthu aagutthe?",
                "options": [
                  "How much time will it take?",
                  "How much will you charge?",
                  "Where are we going?"
                ],
                "correctAnswer": "How much time will it take?"
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'I will give you 100 rupees'?",
                "sentence": "How do you say this in Kannada?",
                "options": [
                  "Naanu nooru rupayi kodthini.",
                  "Naanu naale kodthini.",
                  "Naanu nooru duddu beda."
                ],
                "correctAnswer": "Naanu nooru rupayi kodthini."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Bele swala kammi maadi.",
                "options": [
                  "Please lower the fare a little.",
                  "Where are you going?",
                  "I want to stop here."
                ],
                "correctAnswer": "Please lower the fare a little."
              }
            ]
          },
          {
            "level": 2,
            "questions": [
              {
                "type": "multiple_choice",
                "prompt": "How do you ask about the rent?",
                "sentence":
                    "What is the Kannada phrase for 'How much is the rent?'",
                "options": ["Baadige eshtu?", "Idhu eshtu?", "Mane elli ide?"],
                "correctAnswer": "Bhada eshtu?"
              },
              {
                "type": "translate",
                "prompt": "Translate the phrase",
                "sentence": "Nimage advance eshtu beku?",
                "options": [
                  "How much advance do you need?",
                  "When do I need to pay the rent?",
                  "Is there water available?"
                ],
                "correctAnswer": "How much advance do you need?"
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask if water is available?",
                "sentence":
                    "What is the Kannada phrase for 'Is there water supply?'",
                "options": [
                  "Illi neeru idhya?",
                  "Bhada eshtu?",
                  "Manege yavaga barbeku?"
                ],
                "correctAnswer": "Illi neeru idhya?"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Nanna mane repair maadi.",
                "options": [
                  "Please repair my house.",
                  "I will fix the house.",
                  "Is this house for sale?"
                ],
                "correctAnswer": "Please repair my house."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask about maintenance?",
                "sentence":
                    "What is the Kannada phrase for 'Who is responsible for maintenance?'",
                "options": [
                  "Maintenance yaaru maadthare?",
                  "Maintenance eshtu duddu?",
                  "Yelli maintenance maadthira?"
                ],
                "correctAnswer": "Maintenance yaaru maadthare?"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Maneli current idhya?",
                "options": [
                  "Is there electricity in the house?",
                  "When is the rent due?",
                  "Is the house available?"
                ],
                "correctAnswer": "Is there electricity in the house?"
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask if pets are allowed?",
                "sentence":
                    "What is the Kannada phrase for 'Are pets allowed?'",
                "options": [
                  "Illi pranina saakbohuda?",
                  "Illi neeru idhya?",
                  "Nimage agreement idhya?"
                ],
                "correctAnswer": "Illi pranina saakbohuda?"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Nanna rent kammi maadi.",
                "options": [
                  "Reduce my rent.",
                  "Fix the water problem.",
                  "I am vacating the house."
                ],
                "correctAnswer": "Reduce my rent."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask when you can move in?",
                "sentence":
                    "What is the Kannada phrase for 'When can I move in?'",
                "options": [
                  "Naanu yavaga manege shift agbohudu?",
                  "Nimage duddu eshtu?",
                  "Yelli neeru idhya?"
                ],
                "correctAnswer": "Naanu yavaga manege shift agbohudu?"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Agreement ella yavaga sigutte?",
                "options": [
                  "When will I get the agreement?",
                  "When do I need to pay rent?",
                  "Is there water?"
                ],
                "correctAnswer": "When will I get the agreement?"
              }
            ]
          },
          {
            "level": 3,
            "questions": [
              {
                "type": "multiple_choice",
                "prompt": "How do you ask 'Where are you?' to the auto driver?",
                "sentence": "What is the Kannada phrase for 'Where are you?'",
                "options": [
                  "Neevu elli iddheera?",
                  "Eshtu duddu?",
                  "Nanna hesaru gothilla."
                ],
                "correctAnswer": "Neevu elli iddheera?",
              },
              {
                "type": "translate",
                "prompt": "Translate this sentence",
                "sentence": "Swalpa bele kammi maadi.",
                "options": [
                  "Reduce the price a little.",
                  "Go faster.",
                  "Stop the auto here."
                ],
                "correctAnswer": "Reduce the price a little."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask about the rent?",
                "sentence":
                    "What is the Kannada phrase for 'How much is the rent?'",
                "options": [
                  "Baadige eshtu?",
                  "Eshtu samaya?",
                  "Naanu odutha iddini."
                ],
                "correctAnswer": "Baadige eshtu?",
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Nimage advance eshtu beku?",
                "options": [
                  "How much advance do you need?",
                  "Do you need any help?",
                  "Where are you going?"
                ],
                "correctAnswer": "How much advance do you need?"
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask if something is in stock?",
                "sentence":
                    "What is the Kannada phrase for 'Do you have this item?'",
                "options": [
                  "Idhu nim hatra idhya?",
                  "Nimage duddu idhya?",
                  "Swalpa tagolisi."
                ],
                "correctAnswer": "Idhu nim hatra idhya?"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Nanna mane repair maadi.",
                "options": [
                  "Please repair my house.",
                  "Please clean my house.",
                  "Do you have water?"
                ],
                "correctAnswer": "Please repair my house."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'I want to go to Majestic'?",
                "sentence": "What is the Kannada phrase for this?",
                "options": [
                  "Naanu Majestic ge hogabeku.",
                  "Nanna hesaru Majestic.",
                  "Naale barthini."
                ],
                "correctAnswer": "Naanu Majestic ge hogabeku."
              },
              {
                "type": "translate",
                "prompt": "Translate the phrase",
                "sentence": "Meter mele hogona.",
                "options": [
                  "Let’s go by the meter.",
                  "I want to stop here.",
                  "I will pay later."
                ],
                "correctAnswer": "Let’s go by the meter."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask for a discount from a shopkeeper?",
                "sentence":
                    "What is the Kannada phrase for 'Can you give me a discount?'",
                "options": [
                  "Swalpa kammi maadi.",
                  "Eshtu duddu?",
                  "Bhada eshtu?"
                ],
                "correctAnswer": "Swalpa kammi maadi."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Illi neeru idhya?",
                "options": [
                  "Is there water supply?",
                  "Where is the bathroom?",
                  "Is the house ready?"
                ],
                "correctAnswer": "Is there water supply?"
              },
              {
                "type": "multiple_choice",
                "prompt":
                    "How do you ask 'Do you have change?' to an auto driver?",
                "sentence":
                    "What is the Kannada phrase for 'Do you have change?'",
                "options": [
                  "Nimhathra change idhya?",
                  "Nimage neeru idhya?",
                  "Nimage eshtu duddu beku?"
                ],
                "correctAnswer": "Nimhathra change idhya?"
              },
              {
                "type": "translate",
                "prompt": "Translate the phrase",
                "sentence": "Nanna rent kammi maadi.",
                "options": [
                  "Reduce my rent.",
                  "Increase the rent.",
                  "The rent is too high."
                ],
                "correctAnswer": "Reduce my rent."
              },
              {
                "type": "multiple_choice",
                "prompt":
                    "How do you ask 'When can I move in?' to the landlord?",
                "sentence": "What is the Kannada phrase for this?",
                "options": [
                  "Naanu yavaga manege barabahudu?",
                  "Nimage duddu eshtu?",
                  "Idhu fresh idhya?"
                ],
                "correctAnswer": "Naanu yavaga manege barabahudu?"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Idhu eshtu?",
                "options": [
                  "How much is this?",
                  "Is this fresh?",
                  "Where is this?"
                ],
                "correctAnswer": "How much is this?"
              },
              {
                "type": "multiple_choice",
                "prompt":
                    "How do you ask 'How much time will it take?' to an auto driver?",
                "sentence":
                    "What is the Kannada phrase for 'How much time will it take?'",
                "options": [
                  "Eshtu samaya aaguthade?",
                  "Eshtu duddu beku?",
                  "Nimage change idhya?"
                ],
                "correctAnswer": "Eshtu samaya aaguthade?"
              }
            ]
          },
          {
            "level": 4,
            "questions": [
              {
                "type": "multiple_choice",
                "prompt": "How do you ask the driver to slow down?",
                "sentence":
                    "What is the Kannada phrase for 'Please slow down'?",
                "options": [
                  "Swalpa nidhana maadi.",
                  "Bega hogi.",
                  "Neenu elli iddiya?"
                ],
                "correctAnswer": "Swalpa nidhana maadi."
              },
              {
                "type": "translate",
                "prompt": "Translate this sentence",
                "sentence": "Right thogoli.",
                "options": [
                  "Take a right turn.",
                  "Take a left turn.",
                  "Go straight."
                ],
                "correctAnswer": "Take a right turn."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask the driver to take a left turn?",
                "sentence":
                    "What is the Kannada phrase for 'Take a left turn'?",
                "options": [
                  "Left thogoli.",
                  "Right thogoli.",
                  "Swalpa nidhana maadi."
                ],
                "correctAnswer": "Left thogoli."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Illi nilsi.",
                "options": ["Stop here.", "Turn right here.", "Speed up."],
                "correctAnswer": "Stop here."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask the driver to go straight?",
                "sentence": "What is the Kannada phrase for 'Go straight'?",
                "options": [
                  "Nera hogi.",
                  "Left thogoli.",
                  "Swalpa nidhana maadi."
                ],
                "correctAnswer": "Nera hogi."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Mundhe left thogoli.",
                "options": [
                  "Take a left ahead.",
                  "Turn left now.",
                  "Go straight ahead."
                ],
                "correctAnswer": "Take a left ahead."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask the driver to go faster?",
                "sentence": "What is the Kannada phrase for 'Go faster'?",
                "options": [
                  "Bega hogi.",
                  "Swalpa nidhana maadi.",
                  "Illa nilsi."
                ],
                "correctAnswer": "Bega hogi."
              },
              {
                "type": "translate",
                "prompt": "Translate the phrase",
                "sentence": "Ivage nilsi.",
                "options": ["Stop immediately.", "Go faster.", "Take a right."],
                "correctAnswer": "Stop immediately."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you tell the driver to wait?",
                "sentence":
                    "What is the Kannada phrase for 'Wait for a moment'?",
                "options": [
                  "Ondhu nimisha wait maadi.",
                  "Bega hogi.",
                  "Swalpa nidhana maadi."
                ],
                "correctAnswer": "Ondhu nimisha wait maadi."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Mundhe right thogoli.",
                "options": [
                  "Take a right ahead.",
                  "Take a left turn now.",
                  "Go faster."
                ],
                "correctAnswer": "Take a right ahead."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you tell the driver 'Don’t take this road'?",
                "sentence":
                    "What is the Kannada phrase for 'Don’t take this road'?",
                "options": [
                  "Ee daari thogobedi.",
                  "Right thogoli.",
                  "Nerage hogi."
                ],
                "correctAnswer": "Ee daari thogobedi."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Bega barthira?",
                "options": [
                  "Will you come fast?",
                  "Where are you going?",
                  "How much time will it take?"
                ],
                "correctAnswer": "Will you come fast?"
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you tell the driver to avoid traffic?",
                "sentence": "What is the Kannada phrase for 'Avoid traffic'?",
                "options": [
                  "Traffic avoid maadi.",
                  "Nerage hogi.",
                  "Swalpa nidhana maadi."
                ],
                "correctAnswer": "Traffic avoid maadi."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Illi right thogoli.",
                "options": [
                  "Take a right here.",
                  "Take a left turn here.",
                  "Stop here."
                ],
                "correctAnswer": "Take a right here."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'Drop me here' to the driver?",
                "sentence": "What is the Kannada phrase for 'Drop me here'?",
                "options": [
                  "Nanna illi bidi.",
                  "Nanna manege barabahudu?",
                  "Nanna neeru beku."
                ],
                "correctAnswer": "Nanna illi bidi."
              }
            ]
          }
        ]
      },
    ],
    [
      {
        "courseName": "office",
        "image": Assets.images.heel.path,
        "color": 0xffFFD700,
        "levels": [
          {
            "level": 1,
            "questions": [
              {
                "type": "multiple_choice",
                "prompt": "How do you ask 'What time is the meeting?'",
                "sentence":
                    "What is the Kannada phrase for 'What time is the meeting?'",
                "options": [
                  "Meeting esth-hotthige ide?",
                  "Naale meeting idhya?",
                  "Yelli neeru ide?"
                ],
                "correctAnswer": "Meeting esth-hotthige ide?"
              },
              {
                "type": "translate",
                "prompt": "Translate the phrase",
                "sentence": "Naanu swalpa busy iddhini.",
                "options": [
                  "I am a little busy.",
                  "I have finished the work.",
                  "I am free now."
                ],
                "correctAnswer": "I am a little busy."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'When is the deadline?'",
                "sentence":
                    "What is the Kannada phrase for 'When is the deadline?'",
                "options": [
                  "Deadline yavaga?",
                  "Nimage yen beku?",
                  "Eshtu ghantege office?"
                ],
                "correctAnswer": "Deadline yavaga?"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Naanu meeting-ge hogabeku.",
                "options": [
                  "I need to go to the meeting.",
                  "I will go to the market.",
                  "I am going to lunch."
                ],
                "correctAnswer": "I need to go to the meeting."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask 'Have you completed the task?'",
                "sentence":
                    "What is the Kannada phrase for 'Have you completed the task?'",
                "options": [
                  "Neenu kelsa mugisidya?",
                  "Nimage naale beku?",
                  "Naanu swalpa busy iddini."
                ],
                "correctAnswer": "Neenu kelsa mugisidya?"
              },
              {
                "type": "translate",
                "prompt": "Translate the phrase",
                "sentence": "Nanna office Bengaluralli ide.",
                "options": [
                  "My office is in Bengaluru.",
                  "I am working in Bengaluru.",
                  "I will be traveling tomorrow."
                ],
                "correctAnswer": "My office is in Bengaluru."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask 'Can we postpone the meeting?'",
                "sentence":
                    "What is the Kannada phrase for 'Can we postpone the meeting?'",
                "options": [
                  "Meeting postpone maadbohuda?",
                  "Meeting yelli ide?",
                  "Meeting yavaga?"
                ],
                "correctAnswer": "Meeting postpone maadbohuda?"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Nanna kelsa aaythu.",
                "options": [
                  "I have finished my work.",
                  "I need more time for the work.",
                  "I am busy with my work."
                ],
                "correctAnswer": "I have finished my work."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask 'Do you need any help?'",
                "sentence":
                    "What is the Kannada phrase for 'Do you need any help?'",
                "options": [
                  "Nimage sahaya beka?",
                  "Nimage neeru idhya?",
                  "enu beku?"
                ],
                "correctAnswer": "Nimage sahaya beka?"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Naale officege barthini.",
                "options": [
                  "I will come to the office tomorrow.",
                  "I will work from home tomorrow.",
                  "I have a meeting tomorrow."
                ],
                "correctAnswer": "I will come to the office tomorrow."
              }
            ]
          }
        ]
      },
      {
        "courseName": "numbers",
        "image": Assets.images.hammer.path,
        "color": 0xff808080,
        "levels": [
          {
            "level": 1,
            "questions": [
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'One' in Kannada?",
                "sentence": "What is the Kannada word for 'One'?",
                "options": ["Ondhu", "Moovu", "Aidu"],
                "correctAnswer": "Ondhu"
              },
              {
                "type": "translate",
                "prompt": "Translate the number 'Two' into Kannada",
                "sentence": "Eradu",
                "options": ["Two", "Three", "Four"],
                "correctAnswer": "Two"
              },
              {
                "type": "multiple_choice",
                "prompt": "What is the Kannada word for 'Three'?",
                "sentence": "How do you say 'Three' in Kannada?",
                "options": ["Mooru", "Moov", "Moovaththu"],
                "correctAnswer": "Mooru"
              },
              {
                "type": "translate",
                "prompt": "Translate this sentence",
                "sentence": "Naalkku",
                "options": ["Four", "Five", "Six"],
                "correctAnswer": "Four"
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'Five' in Kannada?",
                "sentence": "What is the Kannada word for 'Five'?",
                "options": ["Aidhu", "Aradu", "Nalku"],
                "correctAnswer": "Aidhu"
              },
              {
                "type": "translate",
                "prompt": "Translate this sentence",
                "sentence": "Aaru",
                "options": ["Six", "Seven", "Five"],
                "correctAnswer": "Six"
              },
              {
                "type": "multiple_choice",
                "prompt": "What is the Kannada word for 'Seven'?",
                "sentence": "How do you say 'Seven' in Kannada?",
                "options": ["ELu", "Aradu", "Moov"],
                "correctAnswer": "ELu"
              },
              {
                "type": "translate",
                "prompt": "Translate this sentence",
                "sentence": "Entu",
                "options": ["Eight", "Nine", "Ten"],
                "correctAnswer": "Eight"
              },
              {
                "type": "multiple_choice",
                "prompt": "What is the Kannada word for 'Nine'?",
                "sentence": "How do you say 'Nine' in Kannada?",
                "options": ["Ombattu", "Entu", "Aaru"],
                "correctAnswer": "Ombattu"
              },
              {
                "type": "translate",
                "prompt": "Translate this sentence",
                "sentence": "Hattu",
                "options": ["Ten", "Nine", "Eight"],
                "correctAnswer": "Ten"
              }
            ]
          },
          {
            "level": 2,
            "questions": [
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'Eleven' in Kannada?",
                "sentence": "What is the Kannada word for 'Eleven'?",
                "options": ["Hadhnondhu", "Hannadu", "Hattu"],
                "correctAnswer": "Hadhnondhu"
              },
              {
                "type": "translate",
                "prompt": "Translate this sentence",
                "sentence": "Hadhnaidhu",
                "options": ["Fifteen", "Thirteen", "Fourteen"],
                "correctAnswer": "Fifteen"
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'Sixteen' in Kannada?",
                "sentence": "What is the Kannada word for 'Sixteen'?",
                "options": ["Hannaradu", "Hadhnaaru", "Hattaru"],
                "correctAnswer": "Hadnaaru"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Hadhmooru",
                "options": ["Thirteen", "Sixteen", "Fourteen"],
                "correctAnswer": "Thirteen"
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask 'How many people?' in Kannada?",
                "sentence": "What is the Kannada phrase for 'How many people?'",
                "options": [
                  "Eshtu janaru?",
                  "Yavaga barthira?",
                  "Yen maadthira?"
                ],
                "correctAnswer": "Eshtu janaru?"
              },
              {
                "type": "translate",
                "prompt": "Translate this sentence",
                "sentence": "Nimage hatthu roti beka?",
                "options": [
                  "Do you want ten rotis?",
                  "Do you want ten people?",
                  "Do you want to go at ten?"
                ],
                "correctAnswer": "Do you want ten rotis?"
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask 'What is the time?'",
                "sentence":
                    "What is the Kannada phrase for 'What is the time?'",
                "options": [
                  "Samaya eshtu?",
                  "Nimage estu rotti?",
                  "Eshtu jana?"
                ],
                "correctAnswer": "Samaya eshtu?"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Nimage eradu coffee beka?",
                "options": [
                  "Do you want two coffees?",
                  "Do you have two coffees?",
                  "Do you need two minutes?"
                ],
                "correctAnswer": "Do you want two coffees?"
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask 'What time is it now?' in Kannada?",
                "sentence":
                    "What is the Kannada phrase for 'What time is it now?'",
                "options": [
                  "Eega eshtu ghante?",
                  "Eshtu janaru?",
                  "Eshtu beka?"
                ],
                "correctAnswer": "Eega eshtu ghante?"
              },
              {
                "type": "translate",
                "prompt": "Translate this sentence",
                "sentence": "Nimage ondhu glass neeru beeka?",
                "options": [
                  "Do you want one glass of water?",
                  "Do you need help with something?",
                  "Can you come at one o'clock?"
                ],
                "correctAnswer": "Do you want one glass of water?"
              }
            ]
          },
        ]
      },
      {
        "courseName": "emotions",
        "image": Assets.images.emotion.path,
        "color": 0xff0000FF,
        "levels": [
          {
            "level": 1,
            "questions": [
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'I am happy' in Kannada?",
                "sentence": "What is the Kannada phrase for 'I am happy'?",
                "options": [
                  "Naanu khushiyaagi iddini.",
                  "Naanu kashta padthini.",
                  "Naanu horatu hogidini."
                ],
                "correctAnswer": "Naanu khushiyaagi iddini."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Naanu thumba dukkha-dalli iddhini.",
                "options": ["I am very sad.", "I am angry.", "I am excited."],
                "correctAnswer": "I am very sad."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'I am angry' in Kannada?",
                "sentence": "What is the Kannada phrase for 'I am angry'?",
                "options": [
                  "Nange kopa barthide.",
                  "Naanu khushiyagi iddini.",
                  "Naanu swalpa tensed iddini."
                ],
                "correctAnswer": "Nange kopa barthide."
              },
              {
                "type": "translate",
                "prompt": "Translate this sentence",
                "sentence": "Nange hedarike.",
                "options": ["I am scared.", "I am tired.", "I am hopeful."],
                "correctAnswer": "I am scared."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'I am excited' in Kannada?",
                "sentence": "What is the Kannada phrase for 'I am excited'?",
                "options": [
                  "Naanu utsaha-dalli iddini.",
                  "Naanu swalpa thumba iddini.",
                  "Naanu tensed iddini."
                ],
                "correctAnswer": "Naanu utsaha-dalli iddini."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Naanu tensed iddhini.",
                "options": [
                  "I am feeling tense.",
                  "I am relaxed.",
                  "I am happy."
                ],
                "correctAnswer": "I am feeling tense."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'I am worried' in Kannada?",
                "sentence": "What is the Kannada phrase for 'I am worried'?",
                "options": [
                  "Naanu chinte maadthaiddhini.",
                  "Naanu bisi padthini.",
                  "Naanu utsaha iddini."
                ],
                "correctAnswer": "Naanu chinte maadthaiddhini."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Naanu relaxed iddhini.",
                "options": [
                  "I am feeling relaxed.",
                  "I am feeling sad.",
                  "I am feeling angry."
                ],
                "correctAnswer": "I am feeling relaxed."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'I am feeling tired'?",
                "sentence":
                    "What is the Kannada phrase for 'I am feeling tired'?",
                "options": [
                  "Nange susth aagidhe.",
                  "Naanu bisi padthini.",
                  "Naanu utsaha iddini."
                ],
                "correctAnswer": "Nange susth aagidhe."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Naanu naguttha iddhini.",
                "options": ["I am laughing.", "I am crying.", "I am sad."],
                "correctAnswer": "I am laughing."
              }
            ]
          },
          {
            "level": 2,
            "questions": [
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'I am frustrated' in Kannada?",
                "sentence": "What is the Kannada phrase for 'I am frustrated'?",
                "options": [
                  "Naanu niraasha aagidhe.",
                  "Naanu khushiyagi iddini.",
                  "Naanu utsaha iddini."
                ],
                "correctAnswer": "Naanu niraasha aagidhe."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Naanu arasaagiddini.",
                "options": [
                  "I am feeling confused.",
                  "I am feeling grateful.",
                  "I am feeling lonely."
                ],
                "correctAnswer": "I am feeling confused."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'I feel embarrassed' in Kannada?",
                "sentence":
                    "What is the Kannada phrase for 'I feel embarrassed'?",
                "options": [
                  "Nange sankocha aagidhe.",
                  "Naanu niraasha padthini.",
                  "Naanu tensed iddini."
                ],
                "correctAnswer": "Nange sankocha aagidhe."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Naanu thumba niraasha aagiddheeni.",
                "options": [
                  "I am very disappointed.",
                  "I am feeling very scared.",
                  "I am feeling very relaxed."
                ],
                "correctAnswer": "I am very disappointed."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'I feel grateful'?",
                "sentence": "What is the Kannada phrase for 'I feel grateful'?",
                "options": [
                  "Naanu kruthagnathe aagidhe.",
                  "Naanu sustha iddini.",
                  "Naanu utsaha iddini."
                ],
                "correctAnswer": "Naanu kruthagnathe aagidhe."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Nange naachike aagidhe.",
                "options": [
                  "I am feeling shy.",
                  "I am feeling proud.",
                  "I am feeling tired."
                ],
                "correctAnswer": "I am feeling shy."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'I am feeling lonely'?",
                "sentence":
                    "What is the Kannada phrase for 'I am feeling lonely'?",
                "options": [
                  "Naanu obbare iddini.",
                  "Naanu sankocha padthini.",
                  "Naanu swarupa iddini."
                ],
                "correctAnswer": "Naanu obbare iddini."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Naanu niraasha padthini.",
                "options": [
                  "I am feeling disappointed.",
                  "I am feeling grateful.",
                  "I am feeling tensed."
                ],
                "correctAnswer": "I am feeling disappointed."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'I am proud of you'?",
                "sentence":
                    "What is the Kannada phrase for 'I am proud of you'?",
                "options": [
                  "Naanu ninna mele abhimana padthini.",
                  "Naanu ninna mele kopa barthide.",
                  "Naanu sustha aagiddini."
                ],
                "correctAnswer": "Naanu ninna mele abhimana padthini."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Naanu thumba santosha-vaagiddhini.",
                "options": [
                  "I am very happy.",
                  "I am very sad.",
                  "I am very angry."
                ],
                "correctAnswer": "I am very happy."
              }
            ]
          },
        ]
      },
    ],
    [
      {
        "courseName": "food & gym",
        "image": Assets.images.dumbbell.path,
        "color": 0xff2b70c9,
        "levels": [
          {
            "level": 1,
            "questions": [
              {
                "type": "multiple_choice",
                "prompt": "How do you ask 'What do you recommend?' in Kannada?",
                "sentence":
                    "What is the Kannada phrase for 'What do you recommend?'",
                "options": [
                  "Neevu enu recommend maadthira?",
                  "Idhu eshtu duddu?",
                  "Neenu swalpa coffee kodthira?"
                ],
                "correctAnswer": "Neevu enu recommend maadthira?"
              },
              {
                "type": "translate",
                "prompt": "Translate this sentence",
                "sentence": "Idhu veg-o non-veg-o?",
                "options": [
                  "Is this vegetarian or non-vegetarian?",
                  "Is this spicy?",
                  "Is this food fresh?"
                ],
                "correctAnswer": "Is this vegetarian or non-vegetarian?"
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask for 'one plate of dosa'?",
                "sentence":
                    "What is the Kannada phrase for 'One plate of dosa'?",
                "options": [
                  "Ondhu plate dosay.",
                  "Ondhu cup coffee.",
                  "Nanna oota aaythu."
                ],
                "correctAnswer": "Ondhu plate dosay."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Swalpa masala kammi maadi.",
                "options": [
                  "Reduce the masala a bit.",
                  "Give me extra masala.",
                  "Is the food spicy?"
                ],
                "correctAnswer": "Reduce the masala a bit."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask 'Is the food spicy?'",
                "sentence":
                    "What is the Kannada phrase for 'Is the food spicy?'",
                "options": [
                  "Oota khara idhya?",
                  "Idhu vegano non-veg?",
                  "Idhu swalpa bekitta?"
                ],
                "correctAnswer": "Oota khara idhya?"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Nange neeru beda.",
                "options": [
                  "I don’t want water.",
                  "I need some water.",
                  "Please bring water."
                ],
                "correctAnswer": "I don’t want water."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask 'How much is the bill?'",
                "sentence":
                    "What is the Kannada phrase for 'How much is the bill?'",
                "options": [
                  "Bill eshtu?",
                  "Idhu vegano?",
                  "Neenu enu recommend maadthira?"
                ],
                "correctAnswer": "Bill eshtu?"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Ondhu cup coffee kodi.",
                "options": [
                  "Give me one cup of coffee.",
                  "Is the coffee available?",
                  "Do you have coffee?"
                ],
                "correctAnswer": "Give me one cup of coffee."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'I am full' after eating?",
                "sentence": "What is the Kannada phrase for 'I am full'?",
                "options": [
                  "Hotte thumb-thu.",
                  "Nanna oota illa.",
                  "Neeru beda."
                ],
                "correctAnswer": "Hotte thumb-thu."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Nimma special dish enu?",
                "options": [
                  "What is your special dish?",
                  "Is the food spicy?",
                  "What do you recommend?"
                ],
                "correctAnswer": "What is your special dish?"
              }
            ]
          },
          {
            "level": 2,
            "questions": [
              {
                "type": "multiple_choice",
                "prompt": "How do you ask 'What workout today?'",
                "sentence":
                    "What is the Kannada phrase for 'What workout today?'",
                "options": [
                  "Ivatthu workout enu?",
                  "Indu eshtu samaya?",
                  "Workout yelli?"
                ],
                "correctAnswer": "Ivatthu workout enu?"
              },
              {
                "type": "translate",
                "prompt": "Translate this sentence",
                "sentence": "Neevu workout mugisidira?",
                "options": [
                  "Did you finish your workout?",
                  "Where is your workout?",
                  "What workout today?"
                ],
                "correctAnswer": "Did you finish your workout?"
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'Lift heavy, bro!'",
                "sentence":
                    "What is the Kannada phrase for 'Lift heavy, bro!'?",
                "options": [
                  "Heavy eshtu thogoli!",
                  "Bega workout mugisi!",
                  "Heavy thogoli bro!"
                ],
                "correctAnswer": "Heavy thogoli bro!"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Protein thandiddheera?",
                "options": [
                  "Did you bring your protein?",
                  "Are you using protein?",
                  "Did you finish your workout?"
                ],
                "correctAnswer": "Did you bring your protein?"
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask 'What protein do you use?'",
                "sentence":
                    "What is the Kannada phrase for 'What protein do you use?'",
                "options": [
                  "Neenu yaava protein use maadthira?",
                  "Indu enu workout?",
                  "Workout yelli?"
                ],
                "correctAnswer": "Neenu yaava protein use maadthira?"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Cardio madthiddheera?",
                "options": [
                  "Are you doing cardio?",
                  "What workout today?",
                  "What time is your workout?"
                ],
                "correctAnswer": "Are you doing cardio?"
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'Let’s do legs today'?",
                "sentence":
                    "What is the Kannada phrase for 'Let’s do legs today'?",
                "options": [
                  "Ivatthu legs maadona.",
                  "Ivatthu cardio maadona.",
                  "Nale legs maadona."
                ],
                "correctAnswer": "Ivatthu legs maadona."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Spot maadi.",
                "options": [
                  "Give me a spot.",
                  "How's your workout?",
                  "What time is the gym?"
                ],
                "correctAnswer": "Give me a spot."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask 'When will you finish your workout?'",
                "sentence":
                    "What is the Kannada phrase for 'When will you finish your workout?'",
                "options": [
                  "Neevu yavaga workout mugistheera?",
                  "Neenu enu workout?",
                  "Yelli gym ide?"
                ],
                "correctAnswer": "Neevu yavaga workout mugistheera?"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Swalpa heavy set maadona.",
                "options": [
                  "Let's do a heavy set.",
                  "Let's go home now.",
                  "Are you finished with your workout?"
                ],
                "correctAnswer": "Let's do a heavy set."
              }
            ]
          }
        ]
      },
      {
        "courseName": "nature",
        "image": Assets.images.tree.path,
        "color": 0xffFF0000,
        "levels": [
          {
            "level": 1,
            "questions": [
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'The weather is nice' in Kannada?",
                "sentence":
                    "What is the Kannada phrase for 'The weather is nice'?",
                "options": [
                  "Hava sookshma ide.",
                  "Nadi nalli neeru ide.",
                  "Mara chennagide."
                ],
                "correctAnswer": "Hava sookshma ide."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "MaLe baratthe.",
                "options": [
                  "It is going to rain.",
                  "The sun is shining.",
                  "The tree is growing."
                ],
                "correctAnswer": "It is going to rain."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask 'Is it sunny today?'",
                "sentence":
                    "What is the Kannada phrase for 'Is it sunny today?'",
                "options": [
                  "Ivatthu bisilu irattha?",
                  "Indu hava eshtu?",
                  "Male elli ide?"
                ],
                "correctAnswer": "Ivatthu bisilu irattha?"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Mara doddadu.",
                "options": [
                  "The tree is big.",
                  "The tree is small.",
                  "The leaf is green."
                ],
                "correctAnswer": "The tree is big."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'The wind is strong'?",
                "sentence":
                    "What is the Kannada phrase for 'The wind is strong'?",
                "options": [
                  "Gaali balavagi ide.",
                  "Neeru tumbidaide.",
                  "Mara neeru thinuttide."
                ],
                "correctAnswer": "Gaali balavagi ide."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Neeru tumba swalpa ide.",
                "options": [
                  "There is very little water.",
                  "There is a lot of water.",
                  "The tree is growing slowly."
                ],
                "correctAnswer": "There is very little water."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you ask 'Is it raining now?'",
                "sentence":
                    "What is the Kannada phrase for 'Is it raining now?'",
                "options": [
                  "Eega male barthidhya?",
                  "Eega surya barthidhya?",
                  "Eega gaali idhya?"
                ],
                "correctAnswer": "Eega male barthidhya?"
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Indu gaali illa.",
                "options": [
                  "There is no wind today.",
                  "There is a lot of wind today.",
                  "It is cloudy today."
                ],
                "correctAnswer": "There is no wind today."
              },
              {
                "type": "multiple_choice",
                "prompt": "How do you say 'The sun is setting'?",
                "sentence":
                    "What is the Kannada phrase for 'The sun is setting'?",
                "options": [
                  "Surya asthamaana aaguttide.",
                  "Gaali thumba idhe.",
                  "Male barthide."
                ],
                "correctAnswer": "Surya asthamaana aaguttide."
              },
              {
                "type": "translate",
                "prompt": "Translate the sentence",
                "sentence": "Hoovu baaluthide.",
                "options": [
                  "The flower is blooming.",
                  "The tree is big.",
                  "The leaf is green."
                ],
                "correctAnswer": "The flower is blooming."
              }
            ]
          }
        ]
      },
    ]
  ];
}

Future<List<List<Course>>> parseCourses({required String firstName}) async {
  final coursesData = await getCoursesData(firstName: firstName);
  return coursesData.map((courseGroup) {
    return courseGroup.map((courseMap) => Course.fromJson(courseMap)).toList();
  }).toList();
}
