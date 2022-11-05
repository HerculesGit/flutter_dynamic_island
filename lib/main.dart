import 'package:flutter/material.dart';
import 'package:flutter_dynamic_island/inject.dart';

import 'config/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(injectProviders(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
