import 'package:flutter/material.dart';
import 'package:projekt_ampel/backend/models/ampel.dart';

class AmpelState extends ChangeNotifier {
  Ampel ampel = Ampel(
    lampeGruen: false,
    lampeGelb: false,
    lampeRot: true,
  );

  void schalten() {
    ampel.schalten();
    notifyListeners();
  }
}
