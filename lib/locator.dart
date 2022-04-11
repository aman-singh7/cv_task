import 'package:cv_task/viewmodel/home_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerFactory<HomeModel>(() => HomeModel());
}
