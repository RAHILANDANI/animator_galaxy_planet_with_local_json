import 'package:animator_galaxy_planet/provider/animated_provider.dart';
import 'package:animator_galaxy_planet/provider/jsonprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';

class DetailScreen extends StatefulWidget {
  int index;
  DetailScreen({super.key, required this.index});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
      upperBound: 1,
      lowerBound: 0,
    );
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<JsonProvider>(context);
    var animateprovider = Provider.of<AnimatedProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: InkWell(
                onTap: () {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .ChangeTheme();
                },
                child: (Provider.of<ThemeProvider>(context).themeModel.isdark ==
                        false)
                    ? Icon(
                        Icons.light_mode,
                        color: Colors.white,
                        size: 30,
                      )
                    : Icon(
                        Icons.dark_mode,
                        color: Colors.black,
                        size: 30,
                      ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RotationTransition(
                  turns: animationController,
                  child: Container(
                    alignment: Alignment.topRight,
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          provider.res['planetjson'][widget.index]['image'],
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "${provider.res['planetjson'][widget.index]['name']}",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Description :-",
                      style: TextStyle(fontSize: 22),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          animateprovider.ChangeAnimation();
                        },
                        child:
                            (animateprovider.animateModel.isanimated == false)
                                ? Text("Click to get Description")
                                : Text("Hide Description"))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                AnimatedContainer(
                    curve: Curves.decelerate,
                    duration: Duration(seconds: 4),
                    height: (animateprovider.animateModel.isanimated == false)
                        ? 0
                        : 200,
                    width: (animateprovider.animateModel.isanimated == false)
                        ? 0
                        : 300,
                    child: Text(
                        "${provider.res['planetjson'][widget.index]['description']}"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
