import 'package:calendar_task/data/network/network_util.dart';
import 'package:calendar_task/data/repository/calendar_repository.dart';
import 'package:get_it/get_it.dart';
import '../domain/repository/calendar_repository.dart';

final getIt = GetIt.instance;
class AppBindings {
  static void setUpDependencies() {
   getIt.registerLazySingleton<NetworkUtil>(() => NetworkUtil());
   getIt.registerLazySingleton<CalendarRepository>(() => CalendarRepositoryImpl(getIt<NetworkUtil>()));

  }
}
