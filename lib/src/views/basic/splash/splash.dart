// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:whatsapp/src/utils/style/images/images.dart';
import 'package:whatsapp/src/views/basic/splash/splash_viewmodel.dart';
import 'package:whatsapp/src/utils/style/color/colors.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SplashViewModel(),
        onViewModelReady: (viewmodel) => viewmodel.init(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: AppColors.black,
            body: Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: Center(
                  child: Image(
                    image: AssetImage(AppImages.whatsAppLogo),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
