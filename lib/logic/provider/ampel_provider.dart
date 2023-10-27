import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projekt_ampel/backend/models/ampel.dart';
import 'package:projekt_ampel/backend/models/app_state.dart';
import 'package:projekt_ampel/logic/provider/ampel_state.dart.dart';
import 'package:projekt_ampel/logic/provider/app_state_manager.dart';

// Provider für AppState
final appStateManagerProvider = StateNotifierProvider<AppStateManager, AppState>((ref) {
  return AppStateManager(
    ampel1State: ref.read(ampel1StateProvider.notifier),
    ampel2State: ref.read(ampel2StateProvider.notifier),
    ampel3State: ref.read(ampel3StateProvider.notifier),
    ampel4State: ref.read(ampel4StateProvider.notifier),
  );
});

// Provider für AmpelState für Ampel 1 bis 4
final ampel1StateProvider = StateNotifierProvider<AmpelState, Ampel>((ref) {
  return AmpelState(uniqueId: 'ampel1', ampel: const Ampel(eingeschaltet: false, lampeRot: false, lampeGelb: false, lampeGruen: false)); // Eindeutige Kennung für Ampel 1
});

final ampel2StateProvider = StateNotifierProvider<AmpelState, Ampel>((ref) {
  return AmpelState(uniqueId: 'ampel2', ampel: const Ampel(eingeschaltet: false, lampeRot: false, lampeGelb: false, lampeGruen: false)); // Eindeutige Kennung für Ampel 2
});

final ampel3StateProvider = StateNotifierProvider<AmpelState, Ampel>((ref) {
  return AmpelState(uniqueId: 'ampel3', ampel: const Ampel(eingeschaltet: false, lampeRot: false, lampeGelb: false, lampeGruen: false)); // Eindeutige Kennung für Ampel 3
});

final ampel4StateProvider = StateNotifierProvider<AmpelState, Ampel>((ref) {
  return AmpelState(uniqueId: 'ampel4', ampel: const Ampel(eingeschaltet: false, lampeRot: false, lampeGelb: false, lampeGruen: false)); // Eindeutige Kennung für Ampel 4
});
