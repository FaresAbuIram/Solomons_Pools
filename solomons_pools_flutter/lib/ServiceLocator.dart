import 'package:get_it/get_it.dart';
import 'CommunicatingManager.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerSingleton(CallsAndMessagesService());
}
