import 'package:easy_localization/easy_localization.dart';

import '../utils/json_keys.dart';

class Album {
  final String name;
  final String artist;
  final String url;
  final String? smallImageUrl;
  final String? bigImageUrl;

  Album({
    required this.name,
    required this.artist,
    required this.url,
    this.smallImageUrl,
    this.bigImageUrl,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      name: json[nameKey] ?? tr('no_name'),
      artist: json[artistKey] ?? tr('no_artist'),
      url: json[urlKey] ?? tr('no_url'),
      smallImageUrl: json[imageKey]?.first[textKey],
      bigImageUrl: json[imageKey]?[2]?[textKey],
    );
  }
}
