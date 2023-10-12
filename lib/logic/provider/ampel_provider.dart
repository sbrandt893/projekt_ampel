import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projekt_ampel/logic/provider/ampel_state.dart.dart';

final ampel1StateProvider = ChangeNotifierProvider<AmpelState>((ref) {
  return AmpelState();
});

final ampel2StateProvider = ChangeNotifierProvider<AmpelState>((ref) {
  return AmpelState();
});

final ampel3StateProvider = ChangeNotifierProvider<AmpelState>((ref) {
  return AmpelState();
});

final ampel4StateProvider = ChangeNotifierProvider<AmpelState>((ref) {
  return AmpelState();
});
