// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:projekt_ampel/backend/models/entities/app_state.dart';
// import 'package:projekt_ampel/backend/models/states/ampel_state.dart.dart';
// import 'package:projekt_ampel/main.dart';

// // AppStateManager ist für die Verwaltung des AppStates zuständig
// class AppStateManager extends StateNotifier<AppState> {
//   // Attribute
//   final AmpelState ampel1State;
//   final AmpelState ampel2State;
//   final AmpelState ampel3State;
//   final AmpelState ampel4State;

// // Konstruktor
//   AppStateManager({
//     required this.ampel1State,
//     required this.ampel2State,
//     required this.ampel3State,
//     required this.ampel4State,
//   }) : super(
//           AppState(
//             ampel1State: ampel1State,
//             ampel2State: ampel2State,
//             ampel3State: ampel3State,
//             ampel4State: ampel4State,
//           ),
//         );

// // toString-Methode für die Ausgabe in der Konsole
//   @override
//   String toString() {
//     return 'AppStateManager{state: $state}';
//   }

//   // AppState lokal speichern
//   Future<void> saveAppState() async {
//     log('saveAppState...');
//     final directory = await getApplicationDocumentsDirectory(); // Holt das Verzeichnis in dem die App gespeichert ist
//     final file = File('${directory.path}/app_state.json'); // Erstellt eine Datei im Verzeichnis

//     try {
//       final AppState appState = state.copyWith // Erstellt eine Kopie des aktuellen AppStates
//           (
//         ampel1State:
//             globalRef?.read(ampel1StateProvider.notifier) ?? ampel1State, // Setzt die AmpelStates auf die aktuellen Werte aus den Providern oder auf die Werte aus dem AppState
//         ampel2State: globalRef?.read(ampel2StateProvider.notifier) ?? ampel2State,
//         ampel3State: globalRef?.read(ampel3StateProvider.notifier) ?? ampel3State,
//         ampel4State: globalRef?.read(ampel4StateProvider.notifier) ?? ampel4State,
//       );

//       await file.writeAsString(jsonEncode(appState.toJson())); // Speichert den AppState als JSON-String in der Datei
//       log('jsonEncode(state.toJson()): ${jsonEncode(appState.toJson())}');
//     } catch (e) {
//       log('Error saving AppState: $e'); // Gibt einen Fehler aus, wenn der AppState nicht gespeichert werden konnte
//     }
//     log('saveAppState...done');
//   }

//   // AppState lokal laden
//   Future<void> loadAppState() async {
//     log('loadAppState...');
//     final directory = await getApplicationDocumentsDirectory();
//     final file = File('${directory.path}/app_state.json');

//     try {
//       if (file.existsSync()) {
//         final jsonString = await file.readAsString();
//         final json = jsonDecode(jsonString);
//         state = AppState.fromJson(json);
//         log('loaded AppState: $state');

//         // Update alle AmpelStates
//         globalRef?.read(ampel1StateProvider.notifier).updateAmpelState(state.ampel1State); // Setzt die AmpelStates auf die Werte aus dem AppState
//         globalRef?.read(ampel2StateProvider.notifier).updateAmpelState(state.ampel2State);
//         globalRef?.read(ampel3StateProvider.notifier).updateAmpelState(state.ampel3State);
//         globalRef?.read(ampel4StateProvider.notifier).updateAmpelState(state.ampel4State);
//       }
//     } catch (e) {
//       log('Error loading AppState: $e');
//     }
//   }
// }
