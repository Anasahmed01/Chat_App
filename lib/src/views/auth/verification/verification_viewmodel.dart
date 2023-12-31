import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp/src/views/auth/login_with_number.dart';

import '../../../app/app.locator.dart';
import '../../home/home.dart';

class VerificationViewModel extends BaseViewModel {
  navigateToLoginView() {
    locator<NavigationService>().replaceWithTransition(
      const LoginWithNumber(),
      opaque: true,
      duration: const Duration(milliseconds: 300),
      transitionStyle: Transition.rightToLeftWithFade,
    );
  }
  navigateToHomeView() {
    locator<NavigationService>().replaceWithTransition(
     const Home(),
      opaque: true,
      duration: const Duration(milliseconds: 300),
      transitionStyle: Transition.rightToLeftWithFade,
    );
  }

  var code = '';
}
