import 'dart:convert';

import 'package:animator_galaxy_planet/model/jsonmodel.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class JsonProvider extends ChangeNotifier {
  Map<String, dynamic> res = {};
  List galaxydata = [];
  List<JsonModel> alldata = [];
  Future<void> getdata() async {
    String data = await rootBundle.loadString("assets/api.json");
    res = jsonDecode(data);
    galaxydata = res['planetjson'];
    alldata = galaxydata
        .map(
          (e) => JsonModel(
            tempc: e['tempc'],
            tempf: e['tempf'],
            position: e['position'],
            name: e['name'],
            image: e['image'],
            velocity: e['velocity'],
            distance: e['distance'],
            description: e['description'],
          ),
        )
        .toList();
    notifyListeners();
  }
}
