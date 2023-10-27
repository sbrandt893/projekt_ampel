import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projekt_ampel/backend/models/app_state.dart';
import 'package:projekt_ampel/logic/provider/ampel_provider.dart';
import 'package:projekt_ampel/logic/provider/ampel_state.dart.dart';
import 'package:projekt_ampel/main.dart';

class AppStateManager extends StateNotifier<AppState> {
  final AmpelState ampel1State;
  final AmpelState ampel2State;
  final AmpelState ampel3State;
  final AmpelState ampel4State;

// Konstruktor
  AppStateManager({
    required this.ampel1State,
    required this.ampel2State,
    required this.ampel3State,
    required this.ampel4State,
  }) : super(
          AppState(
            ampel1State: ampel1State,
            ampel2State: ampel2State,
            ampel3State: ampel3State,
            ampel4State: ampel4State,
          ),
        );

// toString-Methode für die Ausgabe in der Konsole
  @override
  String toString() {
    return 'AppStateManager{state: $state}';
  }

  // AppState lokal speichern
  Future<void> saveAppState() async {
    print('saveAppState...');
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/app_state.json');

    try {
      final AppState appState = state.copyWith(
        ampel1State: globalRef?.read(ampel1StateProvider.notifier) ?? ampel1State,
        ampel2State: globalRef?.read(ampel2StateProvider.notifier) ?? ampel2State,
        ampel3State: globalRef?.read(ampel3StateProvider.notifier) ?? ampel3State,
        ampel4State: globalRef?.read(ampel4StateProvider.notifier) ?? ampel4State,
      );

      await file.writeAsString(jsonEncode(appState.toJson()));
      print('jsonEncode(state.toJson()): ${jsonEncode(appState.toJson())}');
    } catch (e) {
      print('Error saving AppState: $e');
    }
    print('saveAppState...done');
  }

  // AppState lokal laden
  Future<void> loadAppState() async {
    print('loadAppState...');
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/app_state.json');

    try {
      if (file.existsSync()) {
        final jsonString = await file.readAsString();
        final json = jsonDecode(jsonString);
        state = AppState.fromJson(json);
        print('loaded AppState: $state');

        // Update alle AmpelStates
        globalRef?.read(ampel1StateProvider.notifier).updateAmpelState(state.ampel1State);
        globalRef?.read(ampel2StateProvider.notifier).updateAmpelState(state.ampel2State);
        globalRef?.read(ampel3StateProvider.notifier).updateAmpelState(state.ampel3State);
        globalRef?.read(ampel4StateProvider.notifier).updateAmpelState(state.ampel4State);
      }
    } catch (e) {
      print('Error loading AppState: $e');
    }
  }

// AmpelState lokal laden
  // Future<void> loadAmpelState() async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final file = File('${directory.path}/ampel_state_$uniqueId.json');

  //   try {
  //     if (file.existsSync()) {
  //       final jsonString = await file.readAsString();
  //       final json = jsonDecode(jsonString);
  //       state = Ampel.fromJson(json);
  //     }
  //   } catch (e) {
  //     print('Error loading AmpelState ($uniqueId): $e');
  //   }
  // }

  // toJson-Methode für die Serialisierung
  // Map<String, dynamic> toJson() {
  //   return {
  //     'uniqueId': uniqueId,
  //     'ampel': state.toJson(),
  //   };
  // }

  // fromJson-Methode für die Deserialisierung
  // factory AppStateManager.fromJson(Map<String, dynamic> json) {
  //   return AppStateManager(
  //     uniqueId: json['uniqueId'],
  //   );
  // }
}
