import 'dart:ui';

class Thread {
  late String name;
  late int arrival;
  late int quantums;
  late Color color;
  late int te, tr, tp;
  late int pri;
  late bool paused;

  Thread(
      {required this.name,
      required this.arrival,
      required this.quantums,
      required this.color,
      required this.pri}) {
    te = 0;
    tr = 0;
    tp = 0;
    paused = false;
  }

  String getName() {
    return name;
  }

  int getArrival() {
    return arrival;
  }

  int getQuantums() {
    return quantums;
  }

  Color getColor() {
    return color;
  }

  int getTE() {
    return te;
  }

  int getTR() {
    return tr;
  }

  int getTP() {
    return tp;
  }

  setTE(int value) {
    te = value;
  }

  setTR(int value) {
    tr = value;
  }

  setTP(int value) {
    tp = value;
  }

  getPri() {
    return pri;
  }

  setPaused(bool b) {
    paused = b;
  }

  bool getPaused() {
    return paused;
  }
}
