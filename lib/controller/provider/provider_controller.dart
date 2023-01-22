import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

enum Phases { dev, staging, prod }

class CounterProvider with ChangeNotifier {
  int timer = 0;
  int value = 0;
  TextEditingController controller = TextEditingController();
  TextEditingController timerController = TextEditingController();
  increment() {
    value++;
    notifyListeners();
  }

  decremenet() {
    value--;
    notifyListeners();
  }

  assignValue() {
    value = int.parse(controller.text);
    notifyListeners();
  }

  startTimer(bool stop) {
    var temp = int.parse(timerController.text);
    // notifyListeners();
    // final timerc = Timer(Duration(milliseconds: timer), () {
    //   timer++;
    //   return notifyListeners();
    // });
    final timerC = Timer.periodic(
      Duration(seconds: 1),
      (v) {
        if (stop) {
          v.cancel();
        }
        timer++;
        if (timer == temp) {
          v.cancel();
        }
        return notifyListeners();
      },
    );
  }
}
