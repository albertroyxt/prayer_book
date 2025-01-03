import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:prayer_book/config/navigation/routes_config.dart';

import 'modules/home/presentation/screens/home_screen.dart';
import 'modules/splash/presentation/screens/app_wrapper.dart';

void main()  async {
   WidgetsFlutterBinding.ensureInitialized();
   runApp(const AppWrapper());
   final router = FluroRouter();
   configureRoutes(router);
}






