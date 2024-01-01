import 'package:animator_galaxy_planet/model/theme_model.dart';
import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel themeModel = ThemeModel(isdark: false);
  void ChangeTheme() {
    themeModel.isdark = !themeModel.isdark;
    notifyListeners();
  }
}
