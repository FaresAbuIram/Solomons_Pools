import 'package:get_it/get_it.dart';
import 'package:solomons_pools_flutter/classes/CommunicatingManager.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerSingleton(CallsAndMessagesService());
}
