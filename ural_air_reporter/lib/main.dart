import 'package:flutter/material.dart';
import 'package:ural_air_reporter/pages/login_page.dart';
import 'package:ural_air_reporter/pages/settings_page.dart';
import 'package:ural_air_reporter/pages/table_page.dart';

import 'models/app_routes.dart';

void main() {
  runApp(const UralAirReporterApp());
}

class UralAirReporterApp extends StatelessWidget {
  const UralAirReporterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UralAirReporter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.table: (context) => const TablePage(),
        AppRoutes.settings: (context) => const SettingsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}