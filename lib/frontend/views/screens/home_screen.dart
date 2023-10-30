import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projekt_ampel/frontend/views/widgets/ampel_widget.dart';
import 'package:projekt_ampel/logic/provider/ampel_provider.dart';

class HomeScreen extends ConsumerWidget // ConsumerWidget ist ein Widget, welches auf Provider zugreifen kann
{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ampel-Schaltung'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () => ref.read(appStateManagerProvider.notifier).saveAppState(),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(appStateManagerProvider.notifier).loadAppState(),
          ),
        ],
      ),
      body: Center(
        child: AspectRatio // AspectRatio ist ein Widget, welches das Seitenverhältnis eines Widgets festlegt
            (
          aspectRatio: 1,
          child: Stack(
            children: [
              Image.asset('assets/images/kreuzung.jpg'),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AmpelWidget(ampelStateProvider: ampel1StateProvider), // AmpelWidget ist ein Widget, welches die Ampel darstellt
                        AmpelWidget(ampelStateProvider: ampel2StateProvider),
                      ],
                    ),
                  ),
                  const SizedBox(height: 150),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AmpelWidget(ampelStateProvider: ampel3StateProvider),
                        AmpelWidget(ampelStateProvider: ampel4StateProvider),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
