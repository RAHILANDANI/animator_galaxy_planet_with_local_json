import 'package:animator_galaxy_planet/provider/jsonprovider.dart';
import 'package:animator_galaxy_planet/provider/theme_provider.dart';
import 'package:animator_galaxy_planet/viwes/screens/detailscreen.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<JsonProvider>(context);
    return Scaffold(
      body: Swiper(
        itemCount: 9,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(index: index),
                  ));
            },
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        provider.res['planetjson'][index]['image'],
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: InkWell(
                      onTap: () {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .ChangeTheme();
                      },
                      child: (Provider.of<ThemeProvider>(context)
                                  .themeModel
                                  .isdark ==
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
                ),
                Text(
                  "${provider.res['planetjson'][index]['name']}",
                  style: TextStyle(fontSize: 40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 180,
                        alignment: Alignment.center,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "DISTANCE FROM SUN",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "${provider.res['planetjson'][index]['distance']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 32),
                            ),
                            Text(
                              "million miles",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 180,
                        alignment: Alignment.center,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Velocity",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "${provider.res['planetjson'][index]['velocity']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 32),
                            ),
                            Text(
                              "metres/second",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          width: 180,
                          alignment: Alignment.center,
                          height: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black.withOpacity(0.1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Temperature",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "${provider.res['planetjson'][index]['tempf']}°F",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 32),
                                  ),
                                  Text(
                                    "${provider.res['planetjson'][index]['tempc']}°C",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 32),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
