import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projekt_ampel/frontend/routes/app_router.dart';
import 'package:projekt_ampel/logic/provider/ampel_provider.dart';

// Eine globale Referenz auf den WidgetRef um von überall auf die Provider zugreifen zu können
WidgetRef? globalRef;

void main() {
  runApp(
    ProviderScope // ProviderScope macht die Provider für alle Widgets im Baum verfügbar. Es ist mit Riverpod notwendig.
        (
      child: MyApp(
        appRouter: AppRouter(), // Initialisiert den AppRouter zum Navigieren zwischen den Screens
      ),
    ),
  );
}

class MyApp extends ConsumerWidget with WidgetsBindingObserver // WidgetsBindingObserver ist notwendig um den App-Lifecycle zu überwachen
{
  // Dies Methode didChangeAppLifecycleState wird aufgerufen, wenn sich der App-Lifecycle ändert.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        // Wenn die App inaktiv wird, wird der aktuelle AppState gespeichert
        globalRef?.read(appStateManagerProvider.notifier).saveAppState();
        log('AppLifecycleState: inactive');
        break;
      case AppLifecycleState.resumed:
        log('AppLifecycleState: resumed');
        break;
      case AppLifecycleState.paused:
        // Wenn die App pausiert wird, wird der aktuelle AppState gespeichert
        globalRef?.read(appStateManagerProvider.notifier).saveAppState();
        log('AppLifecycleState: paused');
        break;
      case AppLifecycleState.detached:
        // Wenn die App in den Hintergrund wechselt, wird der aktuelle AppState gespeichert
        globalRef?.read(appStateManagerProvider.notifier).saveAppState();
        log('AppLifecycleState: detached');
        break;
    }
  }

  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addObserver(this); // Fügt den Observer hinzu um den App-Lifecycle zu überwachen

    globalRef = ref; // Speichert die globale Referenz auf den WidgetRef um von überall auf die Provider zugreifen zu können
    globalRef?.read(appStateManagerProvider.notifier).loadAppState(); // Lädt den AppState aus dem Speicher

    return MaterialApp(
      title: 'Ampel-Schaltung',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      onGenerateRoute: appRouter.onGenerateRoute, // Ändert die standardmäßige Route-Generierung um die des AppRouter zu verwenden
      initialRoute: Routes.home.name, // Setzt die initiale Route auf die HomeScreen Route
      debugShowCheckedModeBanner: false, // Entfernt das Debug-Banner
    );
  }
}
