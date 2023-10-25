import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projekt_ampel/backend/models/app_state.dart';
import 'package:projekt_ampel/logic/provider/ampel_state.dart';

class AppStateState extends StateNotifier<AppState> {
  final AmpelState ampel1State;

  AppStateState({
    required this.ampel1State,
  }) : super(AppState(
          ampel1State: ampel1State,
        ));

  Future<void> loadAppState() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/app_state.json');

    try {
      if (file.existsSync()) {
        final jsonString = await file.readAsString();
        final json = jsonDecode(jsonString);
        state = AppState.fromJson(json);
        print('AppState: $state');
        print('AppState erfolgreich geladen.');
      }
    } catch (e) {
      print('Fehler beim Laden des AppState: $e');
    }
  }

  Future<void> saveAppState() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/app_state.json');
      print('Speichere AppState in ${file.path}');
      final jsonAppState = toJson();
      print('AppState: $jsonAppState');
      await file.writeAsString(jsonEncode(jsonAppState));
      print('AppState erfolgreich gespeichert.');
    } catch (e) {
      print('Fehler beim Speichern des AppState: $e');
    }
  }

  Map<String, dynamic> toJson() {
    print('AppState.toJson()');
    return {
      'ampel1State': ampel1State.toJson(),
    };
  }

  factory AppStateState.fromJson(Map<String, dynamic> json) {
    return AppStateState(
      ampel1State: AmpelState.fromJson(json['ampel1State']),
    );
  }

  @override
  String toString() {
    return 'AppState(ampel1State: $ampel1State)';
  }
}
