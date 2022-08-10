import 'package:get_it/get_it.dart';
import 'package:student_management/api/Authentication_api/authentication_api.dart';
import 'package:student_management/api/Authentication_api/authentication_implementation.dart';


import 'api/api_utils/api_helper.dart';


GetIt locator = GetIt.instance;
void setupLocator() {
  // services
  locator.registerLazySingleton<API>(() => API());
  // locator.registerLazySingleton<MapService>(() => MapService());

  // API
  locator.registerLazySingleton<AuthenticationApi>(() => AuthenticationApiImpl());


 

  

  // Infrastructure
  // locator.registerLazySingleton<UserInfoCache>(() => UserInfoCache());
}
