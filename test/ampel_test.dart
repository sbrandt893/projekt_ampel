import 'package:flutter_test/flutter_test.dart';
import 'package:projekt_ampel/backend/models/ampel.dart';

void main() {
  test('Instanzierung der Klasse Ampel', () {
    Ampel ampel = Ampel(
      lampeRot: false,
      lampeGelb: false,
      lampeGruen: false,
    );

    expect(ampel.lampeRot, false);
    expect(ampel.lampeGelb, false);
    expect(ampel.lampeGruen, false);
  });

  test('Ampel setLampen()', () {
    Ampel ampel = Ampel(
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

  test('Ampel schalten()', () {
    Ampel ampel = Ampel(
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

  test('Ampel copyWith()', () {
    Ampel ampel = Ampel(
      lampeRot: false,
      lampeGelb: false,
      lampeGruen: false,
    );

    ampel = ampel.copyWith(
      lampeRot: true,
      lampeGelb: false,
      lampeGruen: false,
    );

    expect(ampel.lampeRot, true);
    expect(ampel.lampeGelb, false);
    expect(ampel.lampeGruen, false);
  });
}
