// import 'package:flutter_test/flutter_test.dart';
// import 'package:projekt_ampel/backend/models/entities/auto_ampel.dart';
// import 'package:projekt_ampel/backend/models/states/ampel_state.dart.dart';

// void main() {
//   test('AmpelState()', () {
//     final ampelState = AmpelState(
//       ampel: const AutoAmpel(id: 1),
//     );

//     expect(ampelState.state.id, 1);
//     expect(ampelState.state.eingeschaltet, false);
//     expect(ampelState.state.lampeRot, false);
//     expect(ampelState.state.lampeGelb, false);
//     expect(ampelState.state.lampeGruen, false);
//   });

//   test('AmpelState (ausgeschaltet) einschalten() ', () {
//     final ampelState = AmpelState(
//       ampel: const AutoAmpel(id: 1),
//     );

//     expect(ampelState.state.eingeschaltet, false);
//     expect(ampelState.state.lampeRot, false);
//     expect(ampelState.state.lampeGelb, false);
//     expect(ampelState.state.lampeGruen, false);

//     ampelState.einschalten();

//     expect(ampelState.state.eingeschaltet, true);
//     expect(ampelState.state.lampeRot, true);
//     expect(ampelState.state.lampeGelb, false);
//     expect(ampelState.state.lampeGruen, false);
//   });

//   test('AmpelState (eingeschaltet, grün) einschalten() ', () {
//     final ampelState = AmpelState(
//       ampel: const AutoAmpel(id: 1, eingeschaltet: true, lampeGruen: true),
//     );

//     expect(ampelState.state.eingeschaltet, true);
//     expect(ampelState.state.lampeRot, false);
//     expect(ampelState.state.lampeGelb, false);
//     expect(ampelState.state.lampeGruen, true);

//     ampelState.einschalten();

//     expect(ampelState.state.eingeschaltet, true);
//     expect(ampelState.state.lampeRot, false);
//     expect(ampelState.state.lampeGelb, false);
//     expect(ampelState.state.lampeGruen, true);
//   });

//   test('AmpelState (eingeschaltet, rot) ausschalten() ', () {
//     final ampelState = AmpelState(
//       ampel: const AutoAmpel(id: 1, eingeschaltet: true, lampeRot: true),
//     );

//     expect(ampelState.state.eingeschaltet, true);
//     expect(ampelState.state.lampeRot, true);
//     expect(ampelState.state.lampeGelb, false);
//     expect(ampelState.state.lampeGruen, false);

//     ampelState.ausschalten();

//     expect(ampelState.state.eingeschaltet, false);
//     expect(ampelState.state.lampeRot, false);
//     expect(ampelState.state.lampeGelb, false);
//     expect(ampelState.state.lampeGruen, false);
//   });

//   test('AmpelState (ausgeschaltet, ?rot?) ausschalten() ', () {
//     final ampelState = AmpelState(
//       ampel: const AutoAmpel(id: 1, eingeschaltet: false, lampeRot: true),
//     );

//     expect(ampelState.state.eingeschaltet, false);
//     expect(ampelState.state.lampeRot, true);
//     expect(ampelState.state.lampeGelb, false);
//     expect(ampelState.state.lampeGruen, false);

//     ampelState.ausschalten();

//     expect(ampelState.state.eingeschaltet, false);
//     expect(ampelState.state.lampeRot, true);
//     expect(ampelState.state.lampeGelb, false);
//     expect(ampelState.state.lampeGruen, false);
//   });
// }
