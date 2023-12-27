import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:whatsapp/src/views/home/home.dart';
import 'package:whatsapp/src/views/navigation/calls/calls.dart';
import 'package:whatsapp/src/views/navigation/chat_section/chats_section.dart';
import 'package:whatsapp/src/views/navigation/updates/update.dart';
import '../services/auth_services.dart';
import '../views/basic/splash/splash.dart';

@StackedApp(
  routes: [
    //Basic
    MaterialRoute(page: Splash, initial: true),
    MaterialRoute(page: Home),
    MaterialRoute(page: ChatsSection),
    MaterialRoute(page: Updates),
    MaterialRoute(page: Calls),
  ],
  dependencies: [
    //Main
    Singleton(classType: NavigationService),
    Singleton(classType: AuthServices),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: DialogService),
  ],
)
class App {}
