import 'package:flutter_riverpod/flutter_riverpod.dart';

class Ampel {
  final String id;
  final String farbe;
  final int zeit;

  Ampel({
    required this.id,
    required this.farbe,
    required this.zeit,
  });

  @override
  String toString() {
    return 'Ampel(id: $id, farbe: $farbe, zeit: $zeit)';
  }
}

class AmpelState {
  final String farbe;
  final int zeit;

  AmpelState({
    required this.farbe,
    required this.zeit,
  });

  AmpelState copyWith({
    String? farbe,
    int? zeit,
  }) {
    return AmpelState(
      farbe: farbe ?? this.farbe,
      zeit: zeit ?? this.zeit,
    );
  }

  @override
  String toString() {
    return 'AmpelState(farbe: $farbe, zeit: $zeit)';
  }
}

class AmpelStateProvider extends StateNotifier<AmpelState> {
  AmpelStateProvider({required this.ampel}) : super(AmpelState(farbe: ampel.farbe, zeit: ampel.zeit));

  final Ampel ampel;

  void setFarbe(String farbe) {
    state = state.copyWith(farbe: farbe);
  }

  void setZeit(int zeit) {
    state = state.copyWith(zeit: zeit);
  }

  AmpelState get getState => state; // Erlaubt den Zugriff auf den state

  // Optional, um den State zu ändern
  void updateState(AmpelState newState) {
    state = newState;
  }
}

void main(List<String> args) {
  // Erstelle eine Ampel
  final ampel = Ampel(
    id: "ampel_1",
    farbe: "rot",
    zeit: 30,
  );
  print(ampel);

  // Erstelle einen Provider für die Ampel
  final ampelProvider = AmpelStateProvider(ampel: ampel);
  print(ampelProvider.getState);

  // Erhöhe die Zeit der Ampel
  ampelProvider.setZeit(ampelProvider.getState.zeit + 1);
  print(ampelProvider.getState);

  // Lies die Farbe der Ampel
  final farbe = ampelProvider.getState.farbe;
  print(farbe);
}
