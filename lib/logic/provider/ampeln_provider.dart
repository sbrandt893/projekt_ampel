import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projekt_ampel/backend/interfaces/basis_ampel.dart';
import 'package:projekt_ampel/logic/provider/ampeln_notifier.dart';

final ampelnProvider = StateNotifierProvider<AmpelnNotifier, List<BasisAmpel>>((ref) {
  return AmpelnNotifier();
});
