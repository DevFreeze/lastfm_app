import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../models/album.dart';
import '../../provider/search_provider.dart';
import '../theme/textstyles.dart';
import '../widgets/album_list_tile.dart';
import '../widgets/search_textfield.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchTextEditingController;
  late FocusNode _focusNode;
  final _albumSearchResults = <Album>[];

  @override
  void initState() {
    super.initState();
    _searchTextEditingController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('album_search'),
        ),
      ),
      body: Consumer<SearchProvider>(
        builder: (_, searchProvider, __) {
          return Column(
            children: [
              SearchTextField(
                textEditingController: _searchTextEditingController,
                focusNode: _focusNode,
                onTextChanged: (query) async {
                  final _searchResults = await searchProvider.getAlbumsBySearchQuery(query);
                  setState(() {
                    _albumSearchResults
                      ..clear()
                      ..addAll(_searchResults);
                  });
                },
                onEditingComplete: () {
                  _focusNode.unfocus();
                },
                onSuffixIconPressed: () {
                  _focusNode.unfocus();
                  _searchTextEditingController.clear();
                  setState(() {
                    _albumSearchResults.clear();
                  });
                },
              ),
              if (_searchTextEditingController.text.isEmpty)
                _InfoMessage(
                  text: tr('search_for_album'),
                ),
              if (_albumSearchResults.isEmpty && _searchTextEditingController.text.isNotEmpty)
                _InfoMessage(
                  text: tr('no_results'),
                )
              else
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListView(
                      children: [
                        ..._albumSearchResults.map(
                          (album) => AlbumListTile(
                            album: album,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchTextEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}

class _InfoMessage extends StatelessWidget {
  final String text;

  const _InfoMessage({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
        child: Text(
          text,
          style: TextStyles.title3,
        ),
      ),
    );
  }
}
