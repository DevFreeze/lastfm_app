import 'package:flutter/material.dart';

import 'models/album.dart';
import 'ui/screens/album_detail_view.dart';
import 'ui/screens/error_screen.dart';
import 'ui/screens/search_screen.dart';

class Routes {
  Routes._();

  static const String search = '/search';
  static const String albumDetails = '/album-details';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.search:
      return MaterialPageRoute(
        builder: (context) => SearchScreen(),
      );
    case Routes.albumDetails:
      if (settings.arguments?.runtimeType == Album) {
        return MaterialPageRoute(
          builder: (context) => AlbumDetailView(
            album: (settings.arguments as Album),
          ),
        );
      }

      return MaterialPageRoute(
        builder: (context) => ErrorScreen(),
      );
    default:
      {
        return MaterialPageRoute(
          builder: (context) => SearchScreen(),
        );
      }
  }
}
