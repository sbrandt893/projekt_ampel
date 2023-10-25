import 'package:projekt_ampel/logic/provider/ampel_state.dart';

// AppState-Model
class AppState {
  // Attribute
  final AmpelState _ampel1State;

// Konstruktor
  AppState({
    required AmpelState ampel1State,
  }) : _ampel1State = ampel1State;

  AmpelState get ampel1State => _ampel1State;

// copyWith-Methode die eine neue Ampel mit den übergebenen Werten zurückgibt (immutable)
  AppState copyWith({
    AmpelState? ampel1State,
  }) {
    return AppState(
      ampel1State: ampel1State ?? _ampel1State,
    );
  }

// toString-Methode für die Ausgabe in der Konsole
  @override
  String toString() {
    return 'Ampel( ampel1State: $ampel1State)';
  }

// toJson-Methode für die Serialisierung
  Map<String, dynamic> toJson() {
    return {
      'ampel1State': ampel1State.toJson(),
    };
  }

// fromJson-Methode für die Deserialisierung
  factory AppState.fromJson(Map<String, dynamic> json) {
    print('AppState.fromJson()' + json.toString());
    return AppState(
      ampel1State: AmpelState.fromJson(json['ampel1State']),
    );
  }
}
