import 'dart:async';

import 'package:animator_galaxy_planet/provider/jsonprovider.dart';
import 'package:animator_galaxy_planet/viwes/screens/getstart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? res;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    Provider.of<JsonProvider>(context, listen: false).getdata().then(
      (value) {
        Timer(
          Duration(seconds: 3),
          () {
            (res == true)
                ? Navigator.pushReplacementNamed(context, 'homepage')
                : Navigator.pushReplacementNamed(context, 'intro');
          },
        );
      },
    );
  }

  Future<void> getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    res = prefs.getBool('isstarted');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: NetworkImage(
                "https://media.istockphoto.com/id/174627829/photo/solar-system.jpg?s=612x612&w=0&k=20&c=aRu0EmBkVU_CCovAlLftRjk2AC1Jr3DRpJSIB--zkuM="),
          ),
        ),
      ),
    );
  }
}
