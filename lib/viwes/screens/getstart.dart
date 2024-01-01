import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class intro extends StatefulWidget {
  const intro({super.key});

  @override
  State<intro> createState() => _introState();
}

class _introState extends State<intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(""),
          Center(
            child: Text(
              "Welcome to the Galaxy",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('isstarted', true).then(
                          (value) => Navigator.pushReplacementNamed(
                              context, 'homepage'),
                        );
                  },
                  child: Text("Start"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
