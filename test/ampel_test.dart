import 'package:flutter_test/flutter_test.dart';
import 'package:projekt_ampel/backend/models/ampel.dart';

void main() {
  test('Instanzierung der Klasse Ampel', () {
    Ampel ampel = const Ampel(
      eingeschaltet: false,
      lampeRot: false,
      lampeGelb: false,
      lampeGruen: false,
    );

    expect(ampel.eingeschaltet, false);
    expect(ampel.lampeRot, false);
    expect(ampel.lampeGelb, false);
    expect(ampel.lampeGruen, false);
  });

  test('Ampel setLampen()', () {
    Ampel ampel = const Ampel(
      eingeschaltet: false,
      lampeRot: false,
      lampeGelb: false,
      lampeGruen: false,
    );

    ampel = ampel.setLampen(
      lampeRot: true,
      lampeGelb: true,
      lampeGruen: true,
    );

    expect(ampel.lampeRot, true);
    expect(ampel.lampeGelb, true);
    expect(ampel.lampeGruen, true);
  });

  test('Ampel aus einschalten()', () {
    Ampel ampel = const Ampel(
      eingeschaltet: false,
      lampeRot: false,
      lampeGelb: false,
      lampeGruen: false,
    );

    ampel = ampel.einschalten();
    expect(ampel.eingeschaltet, true);
    expect(ampel.lampeRot, true);
    expect(ampel.lampeGelb, false);
    expect(ampel.lampeGruen, false);
  });

  test('Ampel ein ausschalten()', () {
    Ampel ampel = const Ampel(
      eingeschaltet: false,
      lampeRot: true,
      lampeGelb: false,
      lampeGruen: false,
    );

    ampel = ampel.ausschalten();
    expect(ampel.eingeschaltet, false);
    expect(ampel.lampeRot, false);
    expect(ampel.lampeGelb, false);
    expect(ampel.lampeGruen, false);
  });

  test('Ampel Grün auf Gelb schalten()', () {
    Ampel ampel = const Ampel(
      eingeschaltet: true,
      lampeRot: false,
      lampeGelb: false,
      lampeGruen: true,
    );

    ampel = ampel.schalten();
    expect(ampel.lampeRot, false);
    expect(ampel.lampeGelb, true);
    expect(ampel.lampeGruen, false);
  });

  test('Ampel Gelb auf Rot schalten()', () {
    Ampel ampel = const Ampel(
      eingeschaltet: true,
      lampeRot: false,
      lampeGelb: true,
      lampeGruen: false,
    );

    ampel = ampel.schalten();
    expect(ampel.lampeRot, true);
    expect(ampel.lampeGelb, false);
    expect(ampel.lampeGruen, false);
  });

  test('Ampel Rot auf Rot-Gelb schalten()', () {
    Ampel ampel = const Ampel(
      eingeschaltet: true,
      lampeRot: true,
      lampeGelb: false,
      lampeGruen: false,
    );

    ampel = ampel.schalten();
    expect(ampel.lampeRot, true);
    expect(ampel.lampeGelb, true);
    expect(ampel.lampeGruen, false);
  });

  test('Ampel Rot-Gelb auf Grün schalten()', () {
    Ampel ampel = const Ampel(
      eingeschaltet: true,
      lampeRot: true,
      lampeGelb: true,
      lampeGruen: false,
    );

    ampel = ampel.schalten();
    expect(ampel.lampeRot, false);
    expect(ampel.lampeGelb, false);
    expect(ampel.lampeGruen, true);
  });

  test('Ampel Grün aber aus schalten()', () {
    Ampel ampel = const Ampel(
      eingeschaltet: false,
      lampeRot: false,
      lampeGelb: false,
      lampeGruen: true,
    );

    ampel = ampel.schalten();
    expect(ampel.eingeschaltet, false);
    expect(ampel.lampeRot, false);
    expect(ampel.lampeGelb, false);
    expect(ampel.lampeGruen, true);
  });

  test('Ampel copyWith()', () {
    Ampel ampel = const Ampel(
      eingeschaltet: false,
      lampeRot: false,
      lampeGelb: false,
      lampeGruen: false,
    );

    ampel = ampel.copyWith(
      eingeschaltet: true,
      lampeRot: false,
      lampeGelb: false,
      lampeGruen: true,
    );

    expect(ampel.eingeschaltet, true);
    expect(ampel.lampeRot, false);
    expect(ampel.lampeGelb, false);
    expect(ampel.lampeGruen, true);
  });
}
