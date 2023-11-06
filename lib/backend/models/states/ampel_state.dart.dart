import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projekt_ampel/backend/models/entities/basis_auto_ampel.dart';

// AmpelState ist für die Verwaltung der Ampel zuständig
class AmpelState extends StateNotifier<BasisAutoAmpel> {
  // Attribute
  final BasisAutoAmpel ampel;

// Konstruktor
  AmpelState({required this.ampel}) : super(ampel);

// Ampel einschalten
  void einschalten() {
    if (state.eingeschaltet) {
      return;
    }
    state = state.copyWith(
      eingeschaltet: true,
      // lampeRot: true,
      // lampeGelb: false,
      // lampeGruen: false,
    );
  }

// Ampel ausschalten
  void ausschalten() {
    if (!state.eingeschaltet) {
      return;
    }
    state = state.copyWith(
      eingeschaltet: false,
      // lampeRot: false,
      // lampeGelb: false,
      // lampeGruen: false,
    );
  }

// schaltet durch die verschiedenen Ampelphasen (rot, rot-gelb, grün, gelb)
  // void schalten() {
  //   if (!state.eingeschaltet) {
  //     return;
  //   }
  //   // wenn Ampel == rot => rot-gelb
  //   if (state.lampeRot && !state.lampeGelb && !state.lampeGruen) {
  //     state = state.copyWith(
  //       lampeRot: true,
  //       lampeGelb: true,
  //     );
  //   }
  //   // wenn Ampel == rot-gelb => grün
  //   else if (state.lampeRot && state.lampeGelb && !state.lampeGruen) {
  //     state = state.copyWith(
  //       lampeRot: false,
  //       lampeGelb: false,
  //       lampeGruen: true,
  //     );
  //   }
  //   // wenn Ampel == grün => gelb
  //   else if (!state.lampeRot && !state.lampeGelb && state.lampeGruen) {
  //     state = state.copyWith(
  //       lampeGelb: true,
  //       lampeGruen: false,
  //     );
  //   }
  //   // wenn Ampel == gelb => rot
  //   else if (!state.lampeRot && state.lampeGelb && !state.lampeGruen) {
  //     state = state.copyWith(
  //       lampeRot: true,
  //       lampeGelb: false,
  //     );
  //   }
  // }

// setzt die Ampel auf die übergebenen Werte mit copyWith
  // void setLampen({required bool lampeRot, required bool lampeGelb, required bool lampeGruen}) {
  //   state = state.setLampen(lampeRot: lampeRot, lampeGelb: lampeGelb, lampeGruen: lampeGruen);
  // }

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
      'ampel': state.toJson(),
    };
  }

  // fromJson-Methode für die Deserialisierung (Laden)
  factory AmpelState.fromJson(Map<String, dynamic> json) {
    final ampelState = AmpelState(
      ampel: BasisAutoAmpel.fromJson(json['ampel']),
    );
    return ampelState;
  }
}
