// Ampel-Model
import 'package:projekt_ampel/backend/interfaces/basis_ampel.dart';

class BasisAutoAmpel extends BasisAmpel {
// Attribute
// final Sensor sensor;

// Konstruktoren/Factories

  BasisAutoAmpel._({
    required int id,
    required Set<String> zustaende,
    required Map<String, bool> lampen,
    bool eingeschaltet = false,
  }) : super(
          id: id,
          zustaende: zustaende,
          lampen: lampen,
          eingeschaltet: eingeschaltet,
        );

  factory BasisAutoAmpel.vierPhasen({
    required int id,
  }) {
    return BasisAutoAmpel._(
      id: id,
      zustaende: {'rot', 'rot-gelb', 'gruen', 'gelb'},
      lampen: {'rot': false, 'gelb': false, 'gruen': false},
    );
  }

  // Konstruktor für eine Standard-Ampel
  factory BasisAutoAmpel.standard({
    required int id,
    Set<String> zustaende = const {'rot', 'rot-gelb', 'gruen', 'gelb'},
    Map<String, bool> lampen = const {'rot': false, 'gelb': false, 'gruen': false},
  }) {
    return BasisAutoAmpel._(
      id: id,
      zustaende: zustaende,
      lampen: lampen,
    );
  }

// copyWith-Methode die eine neue Ampel mit den übergebenen Werten zurückgibt (immutable)
  BasisAutoAmpel copyWith({
    int? id,
    bool? eingeschaltet,
    Set<String>? zustaende,
    Map<String, bool>? lampen,
  }) {
    return BasisAutoAmpel.updated(
      id: id ?? this.id,
      eingeschaltet: eingeschaltet ?? this.eingeschaltet,
      zustaende: zustaende ?? this.zustaende,
      lampen: lampen ?? this.lampen,
    );
  }

  factory BasisAutoAmpel.updated({
    required int id,
    required bool eingeschaltet,
    required Set<String> zustaende,
    required Map<String, bool> lampen,
  }) {
    return BasisAutoAmpel._(
      id: id,
      eingeschaltet: eingeschaltet,
      zustaende: zustaende,
      lampen: lampen,
    );
  }

// setzt die Ampel auf die übergebenen Werte mit copyWith
  // AutoAmpel setLampen({bool? lampeRot, bool? lampeGelb, bool? lampeGruen}) {
  //   return copyWith(
  //     lampeRot: lampeRot ?? this.lampeRot,
  //     lampeGelb: lampeGelb ?? this.lampeGelb,
  //     lampeGruen: lampeGruen ?? this.lampeGruen,
  //   );
  // }

// toString-Methode für die Ausgabe in der Konsole
  @override
  String toString() {
    return 'Ampel(id: $id, eigeschaltet: $eingeschaltet, zuastände: $zustaende, lampen: $lampen)';
  }

// toJson-Methode für die Serialisierung (Speichern)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'zustaende': zustaende.toList(), // Set in eine Liste umwandeln
      'lampen': lampen,
      'eingeschaltet': eingeschaltet,
    };
  }

// fromJson-Methode für die Deserialisierung (Laden)
  factory BasisAutoAmpel.fromJson(Map<String, dynamic> json) {
    return BasisAutoAmpel(
      id: json['id'],
      zustaende: Set<String>.from(json['zustaende']),
      lampen: Map<String, bool>.from(json['lampen']),
      eingeschaltet: json['eingeschaltet'],
    );
  }
}
