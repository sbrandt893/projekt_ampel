import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projekt_ampel/logic/provider/ampel_state.dart.dart';

final ampelStateProvider = ChangeNotifierProvider<AmpelState>((ref) {
  return AmpelState();
});
