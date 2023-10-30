import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projekt_ampel/backend/models/ampel.dart';
import 'package:projekt_ampel/logic/provider/ampel_state.dart.dart';

class AmpelWidget extends StatelessWidget {
  // Attribute
  final StateNotifierProvider<AmpelState, Ampel> ampelStateProvider; // Der Provider für eine Ampel

  // Konstruktor
  const AmpelWidget({
    Key? key,
    required this.ampelStateProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final ampel = ref.watch(ampelStateProvider); // Definiert eine Variable, welche den aktuellen Wert des Providers enthält und aktualisiert sich bei Änderungen

        return Flexible(
          child: FittedBox(
            child: Container(
              color: Colors.grey[800],
              height: 300,
              width: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(color: ampel.lampeRot ? Colors.red : Colors.grey, border: Border.all(), borderRadius: const BorderRadius.all(Radius.circular(100))),
                  ),
                  Container(
                    height: 75,
                    width: 75,
                    decoration:
                        BoxDecoration(color: ampel.lampeGelb ? Colors.amber : Colors.grey, border: Border.all(), borderRadius: const BorderRadius.all(Radius.circular(100))),
                  ),
                  Container(
                    height: 75,
                    width: 75,
                    decoration:
                        BoxDecoration(color: ampel.lampeGruen ? Colors.green : Colors.grey, border: Border.all(), borderRadius: const BorderRadius.all(Radius.circular(100))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            ampel.eingeschaltet
                                ? ref.read(ampelStateProvider.notifier).ausschalten()
                                : ref.read(ampelStateProvider.notifier).einschalten(); // Ampel ein- oder ausschalten
                          },
                          child: const Icon(
                            Icons.power_settings_new,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            ref.read(ampelStateProvider.notifier).schalten(); // Ampel schalten
                          },
                          child: const Icon(Icons.skip_next),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
