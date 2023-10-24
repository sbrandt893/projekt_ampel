import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projekt_ampel/backend/models/ampel.dart';
import 'package:projekt_ampel/logic/provider/ampel_state.dart.dart';

class AmpelWidget extends StatelessWidget {
  // Parameter allgemeiner AmpelStateProvider
  final StateNotifierProvider<AmpelState, Ampel> ampelStateProvider;

  const AmpelWidget({
    Key? key,
    required this.ampelStateProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final ampel = ref.watch(ampelStateProvider);

        return Flexible(
          child: FittedBox(
            child: Container(
              // margin: const EdgeInsets.only(top: 200, bottom: 200, left: 300, right: 300),
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
                  // const SizedBox(height: 10),
                  Container(
                    height: 75,
                    width: 75,
                    decoration:
                        BoxDecoration(color: ampel.lampeGelb ? Colors.amber : Colors.grey, border: Border.all(), borderRadius: const BorderRadius.all(Radius.circular(100))),
                  ),
                  // const SizedBox(height: 10),
                  Container(
                    height: 75,
                    width: 75,
                    decoration:
                        BoxDecoration(color: ampel.lampeGruen ? Colors.green : Colors.grey, border: Border.all(), borderRadius: const BorderRadius.all(Radius.circular(100))),
                  ),
                  // const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            ampel.eingeschaltet ? ref.read(ampelStateProvider.notifier).ausschalten() : ref.read(ampelStateProvider.notifier).einschalten();
                            // ref.read(counterProvider.notifier).incrementCounter();
                            // ref.read(ampelStateProvider.notifier).einschalten();
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
                            ref.read(ampelStateProvider.notifier).schalten();
                          },
                          child: const Icon(Icons.skip_next),
                        ),
                      ),
                      // const SizedBox(width: 10),
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
