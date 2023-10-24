import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projekt_ampel/backend/models/ampel.dart';
import 'package:projekt_ampel/logic/provider/ampel_state.dart.dart';

// Provider für AmpelState für Ampel 1 bis 4
final ampel1StateProvider = StateNotifierProvider<AmpelState, Ampel>((ref) {
  return AmpelState(uniqueId: 'ampel1'); // Eindeutige Kennung für Ampel 1
});

final ampel2StateProvider = StateNotifierProvider<AmpelState, Ampel>((ref) {
  return AmpelState(uniqueId: 'ampel2'); // Eindeutige Kennung für Ampel 2
});

final ampel3StateProvider = StateNotifierProvider<AmpelState, Ampel>((ref) {
  return AmpelState(uniqueId: 'ampel3'); // Eindeutige Kennung für Ampel 3
});

final ampel4StateProvider = StateNotifierProvider<AmpelState, Ampel>((ref) {
  return AmpelState(uniqueId: 'ampel4'); // Eindeutige Kennung für Ampel 4
});
