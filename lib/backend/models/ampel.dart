import 'dart:developer';

class Ampel {
  final bool _eingeschaltet;
  final bool _lampeRot;
  final bool _lampeGelb;
  final bool _lampeGruen;

  Ampel({
    bool eingeschaltet = false,
    required bool lampeRot,
    required bool lampeGelb,
    required bool lampeGruen,
  })  : _eingeschaltet = eingeschaltet,
        _lampeRot = lampeRot,
        _lampeGelb = lampeGelb,
        _lampeGruen = lampeGruen;

  bool get eingeschaltet => _eingeschaltet;
  bool get lampeRot => _lampeRot;
  bool get lampeGelb => _lampeGelb;
  bool get lampeGruen => _lampeGruen;

  Ampel copyWith({
    bool? eingeschaltet,
    bool? lampeRot,
    bool? lampeGelb,
    bool? lampeGruen,
  }) {
    return Ampel(
      eingeschaltet: eingeschaltet ?? _eingeschaltet,
      lampeRot: lampeRot ?? _lampeRot,
      lampeGelb: lampeGelb ?? _lampeGelb,
      lampeGruen: lampeGruen ?? _lampeGruen,
    );
  }

  // Ampel einschalten
  Ampel einschalten() {
    log('einschalten()');
    return copyWith(eingeschaltet: true, lampeRot: true, lampeGelb: false, lampeGruen: false);
  }

  // Ampel ausschalten
  Ampel ausschalten() {
    log('ausschalten()');
    return copyWith(eingeschaltet: false, lampeRot: false, lampeGelb: false, lampeGruen: false);
  }

// schaltet durch die verschiedenen Ampelphasen
  Ampel schalten() {
    if (!_eingeschaltet) {
      log('Ampel ist ausgeschaltet');
      return this;
    }
    log('schalten()');
    if (lampeGruen && !lampeGelb && !lampeRot) {
      return copyWith(lampeGruen: false, lampeGelb: true);
    } else if (lampeGelb && !lampeRot && !lampeGruen) {
      return copyWith(lampeGelb: false, lampeRot: true);
    } else if (lampeRot && !lampeGelb && !lampeGruen) {
      return copyWith(lampeRot: true, lampeGelb: true);
    } else if (lampeRot && lampeGelb && !lampeGruen) {
      return copyWith(lampeRot: false, lampeGelb: false, lampeGruen: true);
    } else {
      return copyWith(lampeRot: false, lampeGelb: false, lampeGruen: false);
    }
  }

// setzt die Ampel auf die übergebenen Werte mit copyWith
  Ampel setLampen({bool? lampeRot, bool? lampeGelb, bool? lampeGruen}) {
    return copyWith(
      lampeRot: lampeRot ?? this.lampeRot,
      lampeGelb: lampeGelb ?? this.lampeGelb,
      lampeGruen: lampeGruen ?? this.lampeGruen,
    );
  }

  @override
  String toString() {
    return 'Ampel(eingeschaltet: $eingeschaltet, lampeRot: $lampeRot, lampeGelb: $lampeGelb, lampeGruen: $lampeGruen)';
  }
}
