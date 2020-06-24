// Logic around Time to Live

import 'dart:core';

const daysOfLife = 30112.5; // The average lifespan of a male in Australia

bool validateDOB (String dob) {

  RegExp re = RegExp(r'^[1-9].......$');
  if (re.hasMatch(dob)) {
    return true;
  }
  return false;
}




class TimeToLive {
  String dob;




  Duration Remaining (String strDOB) {
    
    if (!validateDOB(strDOB)) {
      throw 'Invalid date of birth, DOB should be yyyymmdd';
    }

    // Convert the string to an actual Datetime
    var dob = DateTime.parse(strDOB);
    var rightNow = DateTime.now();
    
    // Date of death = dob + average male lifespan in Australia
    var dod = dob.add(Duration(days: daysOfLife.toInt()));

    // Time to live = The difference between our date of birth and date of death
    var diffRightNowToDeath = dod.difference(rightNow);

    return diffRightNowToDeath;
  }

  // We only require a DOB to start with
  TimeToLive({this.dob});
}