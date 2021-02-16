import 'package:get_it/get_it.dart';
import 'package:iranpasman/serevices/check_connectivity.dart';

GetIt locator=GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<CheckConnectivity>(() => CheckConnectivity());

}
