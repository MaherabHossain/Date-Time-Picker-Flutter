import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  DateTime date;
  TimeOfDay time;
  setDate(DateTime d) {
    date = d;
    notifyListeners();
  }

  setTime(TimeOfDay t) {
    time = t;
    notifyListeners();
  }
}
