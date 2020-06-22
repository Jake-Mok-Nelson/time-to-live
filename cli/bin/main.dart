import 'dart:async';

import 'package:cli/quotes.dart' as cli;
import 'dart:io';

main(List<String> arguments) {
  
  // Read the date of birth
  var strDt = '19841112';
  var dob = DateTime.parse(strDt);
  
  var daysOfLife = 30112.5; // The average lifespan of a male in Australia

  // What's the time Mr Wolf?
  var rightNow = DateTime.now();
  var diffBirthToNow = rightNow.difference(dob);

  // How long until death?
  var dod = dob.add(Duration(days: daysOfLife.toInt()));
  var diffRightNowToDeath = dod.difference(rightNow);

  // Get a fresh quote each time the application starts
  Map quote = cli.GetRandomQuote();
  

  bool isStopped = false; // Stop the timer when this is set to true
  Timer.periodic(Duration(seconds: 5), (timer) {
    if (isStopped) {
      timer.cancel();
    }

    // Output how long we have left, every minute
    print('Time left in minutes: ${diffRightNowToDeath.inMinutes}');
    print(quote["quote"] + " -- " + quote["author"]);
  });
  
}

