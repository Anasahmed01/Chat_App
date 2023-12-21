import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp/src/views/chat/chat.dart';
import '../../../app/app.locator.dart';

class ChatsSectionViewModel extends BaseViewModel {
  navigateToHomeView() {
    locator<NavigationService>().navigateWithTransition(
      const Chat(),
      opaque: true,
      duration: const Duration(milliseconds: 300),
      transitionStyle: Transition.rightToLeftWithFade,
    );
  }
}
