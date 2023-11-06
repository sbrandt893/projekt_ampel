import 'package:flutter_test/flutter_test.dart';
import 'package:projekt_ampel/backend/models/entities/basis_auto_ampel.dart';
import 'package:projekt_ampel/logic/provider/ampeln_notifier.dart';

void main() {
  group('AmpelnNotifier', () {
    test('addAmpel adds an Ampel', () {
      final notifier = AmpelnNotifier();
      print('AmpelnNotifier created');
      final testAmpel = BasisAutoAmpel(id: 1);
      print('testAmpel created');

      notifier.addAmpel(testAmpel);
      print('testAmpel added');

      expect(notifier.state, contains(testAmpel));
    });

    test('removeAmpel by id', () {
      final notifier = AmpelnNotifier();
      final testAmpel = BasisAutoAmpel(id: 1, eingeschaltet: true);

      expect(testAmpel.eingeschaltet, true);

      notifier.addAmpel(testAmpel);

      final ampelnBefore = notifier.state;
      expect(ampelnBefore.length, 1);
      expect(ampelnBefore, contains(testAmpel));

      notifier.removeAmpel(testAmpel.id);

      final ampelnAfter = notifier.state;
      expect(ampelnAfter, isNot(contains(testAmpel)));
    });
  });
}
