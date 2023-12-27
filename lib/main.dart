import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp/src/utils/style/color/colors.dart';
import 'firebase_options.dart';
import 'src/app/app.locator.dart';
import 'src/app/app.router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: Typography.whiteCupertino,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              foregroundColor: AppColors.whiteColor),
          iconTheme: IconThemeData(color: AppColors.whiteColor),
          scaffoldBackgroundColor: AppColors.backgroundColor,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: AppColors.whiteColor),
            actionsIconTheme: IconThemeData(color: AppColors.whiteColor),
            elevation: 0,
            backgroundColor: AppColors.appbarColor,
          )),
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
