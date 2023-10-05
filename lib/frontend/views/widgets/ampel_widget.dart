import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projekt_ampel/logic/provider/ampel_provider.dart';

class AmpelWidget extends StatelessWidget {
  const AmpelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final ampel = ref.watch(ampelStateProvider).ampel;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(color: ampel.lampeRot ? Colors.red : Colors.grey, border: Border.all(), borderRadius: BorderRadius.all(Radius.circular(100))),
            ),
            const SizedBox(height: 10),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(color: ampel.lampeGelb ? Colors.amber : Colors.grey, border: Border.all(), borderRadius: BorderRadius.all(Radius.circular(100))),
            ),
            const SizedBox(height: 10),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(color: ampel.lampeGruen ? Colors.green : Colors.grey, border: Border.all(), borderRadius: BorderRadius.all(Radius.circular(100))),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.read(ampelStateProvider).schalten();
                print('Ampel: $ampel');
              },
              child: const Text('Schalten'),
            ),
          ],
        );
      },
    );
  }
}
