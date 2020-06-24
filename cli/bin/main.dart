import 'dart:async';
import 'dart:io';
import 'package:console/console.dart';
import 'package:console/curses.dart';

import 'package:cli/quotes.dart' as quotes;
import 'package:cli/ttl.dart' as ttl;


main(List<String> arguments) async {
  
  final strDt = await readInput("What's your DOB (yyyyMMdd): ");

  // Get a fresh quote each time the application starts
  Map quote = quotes.GetRandom();
  

  // Initialise the GUI
  Console.init();
  var window = MainWindow();
  window.display();

  // Rewrite the GUI content every second
  bool isStopped = false; // Stop the timer when this is set to true
  Timer.periodic(Duration(seconds: 1), (timer) {
    if (isStopped) {
      timer.cancel();
    }
    
    ttl.TimeToLive t = ttl.TimeToLive(dob: strDt);
    Console.centerCursor();
    Console.write('${t.Remaining(strDt).inSeconds}');
    Console.nextLine();
    Console.write('${quote["quote"] + " -- " + quote["author"]}');
  });
  
}


class MainWindow extends Window {
  
  MainWindow() : super('Time-To-Live');

  @override
  void draw() {
    super.draw();

    Console.setTextColor(2); // Green
    Console.centerCursor();
    Console.moveToColumn(1);
  
  }

  @override
  void initialize() {
    Keyboard.bindKeys(["q", "Q"]).listen((_) {
      close();
      Console.resetAll();
      Console.eraseDisplay();
      exit(0);
    });
  }
}

