import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projekt_ampel/backend/interfaces/basis_ampel.dart';

class AmpelnNotifier extends StateNotifier<List<BasisAmpel>> {
  AmpelnNotifier() : super([]);

  void addAmpel(BasisAmpel ampel) {
    state = [...state, ampel];
  }

  void removeAmpel(int ampelId) {
    state = [
      for (final ampel in state)
        if (ampel.id != ampelId) ampel,
    ];
  }
}
