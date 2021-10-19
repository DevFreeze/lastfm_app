import 'package:get_it/get_it.dart';

import 'provider/search_provider.dart';
import 'services/api_service.dart';
import 'services/navigation_service.dart';

GetIt services = GetIt.instance;

void setupServices() {
  services
    ..registerLazySingleton<ApiService>(() => ApiService())
    ..registerLazySingleton<NavigationService>(() => NavigationService())
    ..registerSingletonAsync<SearchProvider>(() async => SearchProvider());
}
