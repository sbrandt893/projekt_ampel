import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projekt_ampel/frontend/routes/app_router.dart';

void main() {
  runApp(
    // ProviderScope is a wrapper for your entire application to make sure every provider works properly. It is REQUIRED to use Riverpod.
    ProviderScope(
      child: MyApp(
        // Inject AppRouter for routing
        appRouter: AppRouter(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget with WidgetsBindingObserver {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        print('AppLifecycleState: inactive');
        break;
      case AppLifecycleState.resumed:
        print('AppLifecycleState: resumed');
        break;
      case AppLifecycleState.paused:
        print('AppLifecycleState: paused');
        break;
      case AppLifecycleState.detached:
        print('AppLifecycleState: detached');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Registrieren Sie den Event-Handler für das App-Lebenszyklus hier in der MyApp-Klasse.
    WidgetsBinding.instance.addObserver(this);

    return MaterialApp(
      title: 'Ampel-Schaltung',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      // Use AppRouter generated routes instead of default MaterialApp routes
      onGenerateRoute: appRouter.onGenerateRoute,
      // Set initial route to display after app is loaded
      initialRoute: Routes.home.name,
      debugShowCheckedModeBanner: false,
    );
  }
}
