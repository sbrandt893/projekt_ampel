import 'package:flutter/material.dart';
import 'package:projekt_ampel/backend/models/ampel.dart';

class AmpelState extends ChangeNotifier {
  Ampel ampel = Ampel(
    lampeGruen: false,
    lampeGelb: false,
    lampeRot: false,
  );

  // void einschalten() async {
  //   print('einschalten');

  //   ampel = ampel.copyWith(eingeschaltet: true);
  //   // alle Lampen für 2 Sekunden an
  //   await Future.delayed(const Duration(milliseconds: 100), () {
  //     ampel = ampel.setLampen(
  //       lampeRot: true,
  //       lampeGelb: true,
  //       lampeGruen: true,
  //     );
  //     print('Ampel: $ampel');
  //     notifyListeners();
  //   });

  //   await Future.delayed(const Duration(milliseconds: 1000), () {
  //     ampel = ampel.setLampen(
  //       lampeRot: false,
  //       lampeGelb: false,
  //       lampeGruen: false,
  //     );
  //     notifyListeners();
  //   });

  //   for (var i = 0; i < 3; i++) {
  //     await Future.delayed(const Duration(milliseconds: 300), () {
  //       ampel = ampel.setLampen(
  //         lampeRot: true,
  //         lampeGelb: true,
  //         lampeGruen: true,
  //       );
  //       notifyListeners();
  //     });
  //     await Future.delayed(const Duration(milliseconds: 300), () {
  //       ampel = ampel.setLampen(
  //         lampeRot: false,
  //         lampeGelb: false,
  //         lampeGruen: false,
  //       );
  //       notifyListeners();
  //     });
  //   }
  //   await Future.delayed(const Duration(milliseconds: 1000), () {
  //     ampel = ampel.setLampen(
  //       lampeRot: true,
  //       lampeGelb: false,
  //       lampeGruen: false,
  //     );
  //     notifyListeners();
  //   });
  // }

  void einschalten() {
    ampel = ampel.einschalten();
    notifyListeners();
  }

  void ausschalten() {
    ampel = ampel.ausschalten();
    notifyListeners();
  }

  void schalten() {
    ampel = ampel.schalten();
    notifyListeners();
  }

  void setLampen({required bool lampeRot, required bool lampeGelb, required bool lampeGruen}) {
    ampel.setLampen(
      lampeRot: lampeRot,
      lampeGelb: lampeGelb,
      lampeGruen: lampeGruen,
    );
    notifyListeners();
  }
}
