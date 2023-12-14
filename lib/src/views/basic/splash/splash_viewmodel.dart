// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp/src/views/home/home.dart';
import '../../../app/app.locator.dart';

class SplashViewModel extends BaseViewModel {
  init() {
    Timer(const Duration(seconds: 1), () {
      Timer(const Duration(seconds: 3), () {
        locator<NavigationService>().replaceWithTransition(const Home(),
            opaque: true,
            duration: const Duration(milliseconds: 300),
            transitionStyle: Transition.leftToRightWithFade);
      });
    });
  }

  navigateToHomeView() {
    locator<NavigationService>().replaceWithTransition(
      Home(),
      opaque: true,
      duration: const Duration(milliseconds: 300),
      transitionStyle: Transition.rightToLeftWithFade,
    );
  }
}
