import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projekt_ampel/backend/models/ampel.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class AmpelState extends StateNotifier<Ampel> {
  final String uniqueId; // Eindeutige Kennung für die Ampel

// Konstruktor
  AmpelState({required this.uniqueId})
      : super(Ampel(
          lampeGruen: false,
          lampeGelb: false,
          lampeRot: false,
        )) {
    loadAmpelState();
  }

// Ampel einschalten
  void einschalten() {
    state = state.einschalten();
    saveAmpelState();
  }

// Ampel ausschalten
  void ausschalten() {
    state = state.ausschalten();
    saveAmpelState();
  }

// schaltet durch die verschiedenen Ampelphasen (rot, rot-gelb, grün, gelb)
  void schalten() {
    state = state.schalten();
    saveAmpelState();
  }

// setzt die Ampel auf die übergebenen Werte mit copyWith
  void setLampen({required bool lampeRot, required bool lampeGelb, required bool lampeGruen}) {
    state = state.setLampen(lampeRot: lampeRot, lampeGelb: lampeGelb, lampeGruen: lampeGruen);
    saveAmpelState();
  }

// toString-Methode für die Ausgabe in der Konsole
  @override
  String toString() {
    return 'AmpelState(ampel: $state)';
  }

  // AmpelState lokal speichern
  Future<void> saveAmpelState() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/ampel_state_$uniqueId.json');

    try {
      await file.writeAsString(jsonEncode(state.toJson()));
    } catch (e) {
      print('Error saving AmpelState ($uniqueId): $e');
    }
  }

// AmpelState lokal laden
  Future<void> loadAmpelState() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/ampel_state_$uniqueId.json');

    try {
      if (file.existsSync()) {
        final jsonString = await file.readAsString();
        final json = jsonDecode(jsonString);
        state = Ampel.fromJson(json);
      }
    } catch (e) {
      print('Error loading AmpelState ($uniqueId): $e');
    }
  }

  // toJson-Methode für die Serialisierung
  Map<String, dynamic> toJson() {
    return {
      'uniqueId': uniqueId,
      'ampel': state.toJson(),
    };
  }

  // fromJson-Methode für die Deserialisierung
  factory AmpelState.fromJson(Map<String, dynamic> json) {
    return AmpelState(
      uniqueId: json['uniqueId'],
    );
  }
}
