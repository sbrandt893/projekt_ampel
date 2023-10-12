import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projekt_ampel/frontend/routes/app_router.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(
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
      onGenerateRoute: appRouter.onGenerateRoute,
      initialRoute: Routes.home.name,
      debugShowCheckedModeBanner: false,
    );
  }
}
