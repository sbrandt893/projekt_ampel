import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projekt_ampel/backend/models/ampel.dart';
import 'package:projekt_ampel/backend/models/app_state.dart';
import 'package:projekt_ampel/logic/provider/ampel_state.dart';
import 'package:projekt_ampel/logic/provider/app_state_state.dart';

// Provider für AmpelState für Ampel 1 bis 4
final ampel1StateProvider = StateNotifierProvider<AmpelState, Ampel>((ref) {
  return AmpelState(
      uniqueId: 'ampel1',
      ampel: Ampel(
        lampeGruen: false,
        lampeGelb: false,
        lampeRot: false,
      )); // Eindeutige Kennung für Ampel 1
});

final ampel2StateProvider = StateNotifierProvider<AmpelState, Ampel>((ref) {
  return AmpelState(
      uniqueId: 'ampel2',
      ampel: Ampel(
        lampeGruen: false,
        lampeGelb: false,
        lampeRot: false,
      )); // Eindeutige Kennung für Ampel 2
});

final ampel3StateProvider = StateNotifierProvider<AmpelState, Ampel>((ref) {
  return AmpelState(
      uniqueId: 'ampel3',
      ampel: Ampel(
        lampeGruen: false,
        lampeGelb: false,
        lampeRot: false,
      )); // Eindeutige Kennung für Ampel 3
});

final ampel4StateProvider = StateNotifierProvider<AmpelState, Ampel>((ref) {
  return AmpelState(
      uniqueId: 'ampel4',
      ampel: Ampel(
        lampeGruen: false,
        lampeGelb: false,
        lampeRot: false,
      )); // Eindeutige Kennung für Ampel 4
});

// Provider für AppState
final appStateProvider = StateNotifierProvider<AppStateState, AppState>((ref) {
  return AppStateState(ampel1State: ref.watch(ampel1StateProvider.notifier));
});
