import 'package:animator_galaxy_planet/model/animated_model.dart';
import 'package:flutter/cupertino.dart';

class AnimatedProvider extends ChangeNotifier {
  AnimateModel animateModel = AnimateModel(isanimated: false);
  void ChangeAnimation() {
    animateModel.isanimated = !animateModel.isanimated;
    notifyListeners();
  }
}
