import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projekt_ampel/frontend/views/widgets/ampel_widget.dart';
import 'package:projekt_ampel/logic/provider/ampel_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ampel-Schaltung'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [
              Image.asset('assets/images/kreuzung.jpg'),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 50),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AmpelWidget(ampelStateProvider: ampel1StateProvider),
                        AmpelWidget(ampelStateProvider: ampel2StateProvider),
                      ],
                    ),
                  ),
                  SizedBox(height: 220),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AmpelWidget(ampelStateProvider: ampel3StateProvider),
                        AmpelWidget(ampelStateProvider: ampel4StateProvider),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
