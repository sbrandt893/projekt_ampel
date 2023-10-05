import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projekt_ampel/frontend/views/widgets/ampel_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ampel App'),
        ),
        body: Center(
          child: AmpelWidget(),
        ),
      ),
    );
  }
}
