import 'package:flutter/material.dart';
import 'package:mystore/routes.dart';
import 'package:mystore/services/mainServices.dart';
import 'package:mystore/services/themeServices.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeService()),
    ChangeNotifierProvider(create: (_) => MainServices())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Consumer<ThemeService>(builder: (_, provider, __) {
        return MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          title: 'MyStore',
          theme: provider.themeData,
        );
      });
    });
  }
}
