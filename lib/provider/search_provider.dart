import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/album.dart';
import '../services/api_service.dart';
import '../utils/constants.dart';
import '../utils/json_keys.dart';
import '../services.dart';

class SearchProvider extends ChangeNotifier {

  final _apiService = services<ApiService>();

  static final String _apiUrl = dotenv.env['API_URL'] ?? emptyString;

  static const _baseUrl = 'http://ws.audioscrobbler.com/2.0';
  static const _method = '/?method=';
  static const _albumSearchMethod = 'album.search&album=';
  static const _apiKeyParameter = '&api_key=';
  static const _jsonFormat = '&format=json';

  Future<List<Album>> getAlbumsBySearchQuery(String query) async {
    final _uri = Uri.parse('$_baseUrl$_method$_albumSearchMethod$query$_apiKeyParameter$_apiUrl$_jsonFormat');

    try {
      final _result  = await _apiService.get(_uri);
      final _rawAlbums = _result[resultsKey][albumMatchesKey][albumKey];
      return _rawAlbums.map((json) => Album.fromJson(json)).toList().cast<Album>();
    } catch (_) {
      return [];
    }
  }
}