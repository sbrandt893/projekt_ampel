import 'package:flutter/material.dart';
import 'package:projekt_ampel/backend/models/states/ampel_state.dart.dart';

@immutable
class AppState {
  // Attribute
  final AmpelState _ampel1State;
  final AmpelState _ampel2State;
  final AmpelState _ampel3State;
  final AmpelState _ampel4State;

  // Konstruktor
  const AppState({
    required AmpelState ampel1State,
    required AmpelState ampel2State,
    required AmpelState ampel3State,
    required AmpelState ampel4State,
  })  : _ampel1State = ampel1State,
        _ampel2State = ampel2State,
        _ampel3State = ampel3State,
        _ampel4State = ampel4State;

  // Getter für die Attribute
  AmpelState get ampel1State => _ampel1State;
  AmpelState get ampel2State => _ampel2State;
  AmpelState get ampel3State => _ampel3State;
  AmpelState get ampel4State => _ampel4State;

  // copyWith-Methode die eine neue AppState mit den übergebenen Werten zurückgibt (immutable)
  AppState copyWith({
    AmpelState? ampel1State,
    AmpelState? ampel2State,
    AmpelState? ampel3State,
    AmpelState? ampel4State,
  }) {
    return AppState(
      ampel1State: ampel1State ?? this.ampel1State,
      ampel2State: ampel2State ?? this.ampel2State,
      ampel3State: ampel3State ?? this.ampel3State,
      ampel4State: ampel4State ?? this.ampel4State,
    );
  }

  // toString-Methode für die Ausgabe in der Konsole
  @override
  String toString() {
    return 'AppState{ampel1State: $ampel1State, ampel2State: $ampel2State, ampel3State: $ampel3State, ampel4State: $ampel4State}';
  }

  // equals-Methode für die Überprüfung, ob zwei AppState-Objekte gleich sind
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          _ampel1State == other._ampel1State &&
          _ampel2State == other._ampel2State &&
          _ampel3State == other._ampel3State &&
          _ampel4State == other._ampel4State;

  // toJson-Methode für die Serialisierung (Speichern)
  Map<String, dynamic> toJson() {
    return {
      'ampel1State': ampel1State.toJson(),
      'ampel2State': ampel2State.toJson(),
      'ampel3State': ampel3State.toJson(),
      'ampel4State': ampel4State.toJson(),
    };
  }

  // fromJson-Methode für die Deserialisierung (Laden)
  factory AppState.fromJson(Map<String, dynamic> json) {
    final appState = AppState(
      ampel1State: AmpelState.fromJson(json['ampel1State']),
      ampel2State: AmpelState.fromJson(json['ampel2State']),
      ampel3State: AmpelState.fromJson(json['ampel3State']),
      ampel4State: AmpelState.fromJson(json['ampel4State']),
    );
    return appState;
  }
}
