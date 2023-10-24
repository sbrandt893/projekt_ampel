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

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
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
