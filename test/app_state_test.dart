import 'package:flutter_test/flutter_test.dart';
import 'package:projekt_ampel/backend/models/ampel.dart';
import 'package:projekt_ampel/backend/models/app_state.dart';
import 'package:projekt_ampel/logic/provider/ampel_state.dart.dart';

void main() {
  test('Instanzierung der Klasse AppState', () {
    AppState appState = AppState(
      ampel1State: AmpelState(
        uniqueId: 'ampel1',
        ampel: const Ampel(),
      ),
      ampel2State: AmpelState(
        uniqueId: 'ampel2',
        ampel: const Ampel(),
      ),
      ampel3State: AmpelState(
        uniqueId: 'ampel3',
        ampel: const Ampel(),
      ),
      ampel4State: AmpelState(
        uniqueId: 'ampel4',
        ampel: const Ampel(),
      ),
    );
  });
}
