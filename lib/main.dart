import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'provider/search_provider.dart';
import 'package:provider/provider.dart';

import 'routes.dart';
import 'services.dart';
import 'services/navigation_service.dart';
import 'ui/screens/search_screen.dart';
import 'utils/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load();

  setupServices();
  await services.allReady();

  runApp(
    EasyLocalization(
      supportedLocales: [
        ...SUPPORTED_LANGUAGES.map((local) => Locale(local)),
      ],
      path: INTL_PATH,
      fallbackLocale: const Locale(FALLBACK_LANGUAGE),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => services<SearchProvider>(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: kDebugMode,
        title: 'LastFM App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        navigatorKey: services<NavigationService>().navigatorKey,
        home: SearchScreen(),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
