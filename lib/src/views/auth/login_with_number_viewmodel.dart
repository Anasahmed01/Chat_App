import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp/src/services/auth_services.dart';
import 'package:whatsapp/src/views/auth/verification/verification.dart';
import '../../app/app.locator.dart';

class LoinWithNumberViewModel extends BaseViewModel {
  //TextEditingController phoneNumberControler = TextEditingController();
  navigateToVerificationView() {
    locator<NavigationService>().replaceWithTransition(
      const Verification(),
      opaque: true,
      duration: const Duration(milliseconds: 300),
      transitionStyle: Transition.rightToLeftWithFade,
    );
  }

  String phoneController = '';

  final user = locator<AuthServices>();

  void signIn() {
    user.signInWithPhoneNumber(phoneController);
  }
}
