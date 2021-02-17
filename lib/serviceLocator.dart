import 'package:get_it/get_it.dart';
import 'package:iranpasman/serevices/check_connectivity.dart';
import 'package:iranpasman/showIntrrupt.dart';

GetIt locator=GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<CheckConnectivity>(() => CheckConnectivity());
  locator.registerLazySingleton<ShowInterrupt>(() => ShowInterrupt());


}
