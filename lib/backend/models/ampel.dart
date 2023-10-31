import 'dart:developer';

// Ampel-Model
class Ampel {
// Attribute
  final bool _eingeschaltet; // _eingeschaltet ist private und kann nur innerhalb der Klasse verwendet werden (immutable)
  final bool _lampeRot;
  final bool _lampeGelb;
  final bool _lampeGruen;

// Konstruktor
  const Ampel({
    bool eingeschaltet = false, // eingeschaltet ist required und muss beim Aufruf des Konstruktors übergeben werden
    bool lampeRot = false,
    bool lampeGelb = false,
    bool lampeGruen = false,
  })  : _eingeschaltet = eingeschaltet, // _eingeschaltet wird mit dem übergebenen Wert initialisiert
        _lampeRot = lampeRot,
        _lampeGelb = lampeGelb,
        _lampeGruen = lampeGruen;

// Getter für die Attribute
  bool get eingeschaltet => _eingeschaltet;
  bool get lampeRot => _lampeRot;
  bool get lampeGelb => _lampeGelb;
  bool get lampeGruen => _lampeGruen;

// copyWith-Methode die eine neue Ampel mit den übergebenen Werten zurückgibt (immutable)
  Ampel copyWith({
    bool? eingeschaltet,
    bool? lampeRot,
    bool? lampeGelb,
    bool? lampeGruen,
  }) {
    return Ampel(
      eingeschaltet: eingeschaltet ?? _eingeschaltet, // Wenn eingeschaltet nicht übergeben wird, wird der aktuelle Wert verwendet
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

// toString-Methode für die Ausgabe in der Konsole
  @override
  String toString() {
    return 'Ampel(eingeschaltet: $eingeschaltet, lampeRot: $lampeRot, lampeGelb: $lampeGelb, lampeGruen: $lampeGruen)';
  }

// toJson-Methode für die Serialisierung (Speichern)
  Map<String, dynamic> toJson() // Map<String, dynamic> ist ein assoziatives Array mit String als Schlüssel und dynamic als Wert
  {
    return {
      'eingeschaltet': eingeschaltet,
      'lampeRot': lampeRot,
      'lampeGelb': lampeGelb,
      'lampeGruen': lampeGruen,
    };
  }

// fromJson-Methode für die Deserialisierung (Laden)
  factory Ampel.fromJson(Map<String, dynamic> json) {
    final ampel = Ampel(
      eingeschaltet: json['eingeschaltet'],
      lampeRot: json['lampeRot'],
      lampeGelb: json['lampeGelb'],
      lampeGruen: json['lampeGruen'],
    );
    return ampel;
  }
}
