import 'package:stacked/stacked.dart';
import 'package:whatsapp/src/services/auth_services.dart';

import '../../app/app.locator.dart';

class HomeViewModel extends BaseViewModel {
  var user = locator<AuthServices>();
  logOut() async {
    await user.signOut();
  }
}
