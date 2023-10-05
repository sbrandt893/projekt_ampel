import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projekt_ampel/frontend/views/widgets/ampel_widget.dart';
import 'package:projekt_ampel/logic/provider/ampel_provider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ampel = ref.watch(ampelStateProvider).ampel;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ampel: $ampel'),
        ),
        body: Center(
          child: AmpelWidget(),
        ),
      ),
    );
  }
}
