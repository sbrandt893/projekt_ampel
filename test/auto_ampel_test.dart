import 'package:flutter_test/flutter_test.dart';
import 'package:projekt_ampel/backend/models/entities/basis_auto_ampel.dart';

void main() {
  test('Instanzierung der Klasse Ampel', () {
    BasisAutoAmpel ampel = BasisAutoAmpel.standard(id: 1);

    expect(ampel.id, 1);
    expect(ampel.zustaende, {'rot', 'rot-gelb', 'gruen', 'gelb'});
    expect(ampel.lampen, {'rot': false, 'gelb': false, 'gruen': false});
    expect(ampel.eingeschaltet, false);
  });

  test('Ampel.toJson', () {
    BasisAutoAmpel ampel = BasisAutoAmpel.standard(id: 1);

    expect(ampel.toJson(), {
      'id': 1,
      'zustaende': ['rot', 'rot-gelb', 'gruen', 'gelb'],
      'lampen': {'rot': false, 'gelb': false, 'gruen': false},
      'eingeschaltet': false,
    });
  });

  test('Ampel.fromJson', () {
    BasisAutoAmpel ampel = BasisAutoAmpel.standard(id: 1);

    expect(
      BasisAutoAmpel.fromJson({
        'id': 1,
        'zustaende': ['rot', 'rot-gelb', 'gruen', 'gelb'],
        'lampen': {'rot': false, 'gelb': false, 'gruen': false},
        'eingeschaltet': false,
      }),
      ampel,
    );
  });

//   test('Ampel setLampen()', () {
//     AutoAmpel ampel = const AutoAmpel(
//       id: 1,
//       eingeschaltet: false,
//       lampeRot: false,
//       lampeGelb: false,
//       lampeGruen: false,
//     );

//     ampel = ampel.setLampen(
//       lampeRot: true,
//       lampeGelb: true,
//       lampeGruen: true,
//     );

//     expect(ampel.lampeRot, true);
//     expect(ampel.lampeGelb, true);
//     expect(ampel.lampeGruen, true);
//   });

//   test('Ampel copyWith()', () {
//     AutoAmpel ampel = const AutoAmpel(
//       id: 1,
//       eingeschaltet: false,
//       lampeRot: false,
//       lampeGelb: false,
//       lampeGruen: false,
//     );

//     ampel = ampel.copyWith(
//       eingeschaltet: true,
//       lampeRot: false,
//       lampeGelb: false,
//       lampeGruen: true,
//     );

//     expect(ampel.eingeschaltet, true);
//     expect(ampel.lampeRot, false);
//     expect(ampel.lampeGelb, false);
//     expect(ampel.lampeGruen, true);
//   });
}
