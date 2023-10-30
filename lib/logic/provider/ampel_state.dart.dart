import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projekt_ampel/backend/models/ampel.dart';

// AmpelState ist für die Verwaltung der Ampel zuständig
class AmpelState extends StateNotifier<Ampel> {
  // Attribute
  final String uniqueId; // Eindeutige Kennung für die Ampel
  final Ampel ampel;

// Konstruktor
  AmpelState({required this.uniqueId, required this.ampel}) : super(ampel);

// Ampel einschalten
  void einschalten() {
    state = state.einschalten(); // Setzt den State auf den neuen Wert nach dem Einschalten
  }

// Ampel ausschalten
  void ausschalten() {
    state = state.ausschalten();
  }

// schaltet durch die verschiedenen Ampelphasen (rot, rot-gelb, grün, gelb)
  void schalten() {
    state = state.schalten();
  }

// setzt die Ampel auf die übergebenen Werte mit copyWith
  void setLampen({required bool lampeRot, required bool lampeGelb, required bool lampeGruen}) {
    state = state.setLampen(lampeRot: lampeRot, lampeGelb: lampeGelb, lampeGruen: lampeGruen);
  }

// toString-Methode für die Ausgabe in der Konsole
  @override
  String toString() {
    return 'AmpelState(ampel: $state)';
  }

  // Update AmpelState
  void updateAmpelState(AmpelState ampelState) {
    state = ampelState.ampel;
  }

  // toJson-Methode für die Serialisierung (Speichern)
  Map<String, dynamic> toJson() {
    return {
      'uniqueId': uniqueId,
      'ampel': state.toJson(),
    };
  }

  // fromJson-Methode für die Deserialisierung (Laden)
  factory AmpelState.fromJson(Map<String, dynamic> json) {
    final ampelState = AmpelState(
      uniqueId: json['uniqueId'],
      ampel: Ampel.fromJson(json['ampel']),
    );
    return ampelState;
  }
}
