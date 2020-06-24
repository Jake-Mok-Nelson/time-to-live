import 'dart:math';

// Handling our quotes

List<Map<String, dynamic>> quotes = [
    {
        "author": "Bill Watterson",
        "quote": "There's never enough time to do all the nothing you want."
    },
    {
        "author": "Joyce Rachelle",
        "quote" : "Sometimes exhaustion is not a result of too much time spent on something, but of knowing that in its place, no time is spent on something else."
    },
    {
        "author": "Vincent Okay Nwachukwu",
        "quote": "Life is lived in time. Therefore he who wastes time, wastes life."
    },
    {
        "author": "Marie Curie",
        "quote": "Nothing in life is to be feared, it is only to be understood. Now is the time to understand more, so that we may fear less."
    },
    {
        "author": "Bob Marley",
        "quote": "Open your eyes, look within. Are you satisfied with the life you're living?"
    },
    {
        "author": "Friedrich Nietzsche",
        "quote": "He who has a why to live can bear almost any how."
    }
];

Map GetRandom(){
  final _random = new Random();
  
  // Get a random number between min and max
  int next(int min, int max) => min + _random.nextInt(max - min);
  
  // Get a random number between 0 and the max range of quotes
  int pick = next(0, quotes.length.toInt());

  Map chosenQuote = quotes[pick];
  return chosenQuote;
}

