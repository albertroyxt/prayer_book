import 'package:flutter/material.dart';
import 'package:prayer_book/modules/home/presentation/screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home:HomeScreen(),
    );
  }
}