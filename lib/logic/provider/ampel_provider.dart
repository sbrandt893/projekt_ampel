// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:projekt_ampel/backend/models/entities/auto_ampel.dart';
// import 'package:projekt_ampel/backend/models/entities/app_state.dart';
// import 'package:projekt_ampel/backend/models/states/ampel_state.dart.dart';
// import 'package:projekt_ampel/logic/provider/app_state_manager.dart';

// // Provider für AppState
// final appStateManagerProvider = StateNotifierProvider<AppStateManager, AppState>((ref) {
//   return AppStateManager(
//     ampel1State: ref.read(ampel1StateProvider.notifier), // Liest den Provider für Ampel 1 aus
//     ampel2State: ref.read(ampel2StateProvider.notifier),
//     ampel3State: ref.read(ampel3StateProvider.notifier),
//     ampel4State: ref.read(ampel4StateProvider.notifier),
//   );
// });

// // Provider für AmpelState für Ampel 1 bis 4
// final ampel1StateProvider = StateNotifierProvider<AmpelState, AutoAmpel>((ref) {
//   return AmpelState(ampel: AutoAmpel(id: 1, zustaende: {'rot', 'rot-gelb', 'gruen', 'gelb'}, lampen: {'rot': false, 'gelb': false, 'gruen': false}));
// });

// final ampel2StateProvider = StateNotifierProvider<AmpelState, AutoAmpel>((ref) {
//   return AmpelState(ampel: AutoAmpel(id: 2, zustaende: {'rot', 'rot-gelb', 'gruen', 'gelb'}, lampen: {'rot': false, 'gelb': false, 'gruen': false}));
// });

// final ampel3StateProvider = StateNotifierProvider<AmpelState, AutoAmpel>((ref) {
//   return AmpelState(ampel: AutoAmpel(id: 3, zustaende: {'rot', 'rot-gelb', 'gruen', 'gelb'}, lampen: {'rot': false, 'gelb': false, 'gruen': false}));
// });

// final ampel4StateProvider = StateNotifierProvider<AmpelState, AutoAmpel>((ref) {
//   return AmpelState(ampel: AutoAmpel(id: 4, zustaende: {'rot', 'rot-gelb', 'gruen', 'gelb'}, lampen: {'rot': false, 'gelb': false, 'gruen': false}));
// });
