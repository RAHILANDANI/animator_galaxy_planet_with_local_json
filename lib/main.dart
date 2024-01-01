import 'package:animator_galaxy_planet/provider/animated_provider.dart';
import 'package:animator_galaxy_planet/provider/jsonprovider.dart';
import 'package:animator_galaxy_planet/provider/theme_provider.dart';
import 'package:animator_galaxy_planet/viwes/screens/getstart.dart';
import 'package:animator_galaxy_planet/viwes/screens/homepage.dart';
import 'package:animator_galaxy_planet/viwes/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => JsonProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AnimatedProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        darkTheme: ThemeData.dark(),
        theme: ThemeData.light(),
        themeMode:
            (Provider.of<ThemeProvider>(context).themeModel.isdark == false)
                ? ThemeMode.dark
                : ThemeMode.light,
        routes: {
          '/': (context) => SplashScreen(),
          'homepage': (context) => HomePage(),
          'intro': (context) => intro(),
        },
      ),
    ),
  );
}
