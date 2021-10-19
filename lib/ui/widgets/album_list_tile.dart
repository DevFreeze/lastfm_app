import 'package:flutter/material.dart';

import '../../models/album.dart';
import '../../routes.dart';
import '../../services.dart';
import '../../services/navigation_service.dart';
import 'rounded_image.dart';

class AlbumListTile extends StatelessWidget {
  final Album album;

  const AlbumListTile({
    Key? key,
    required this.album,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(album.artist),
        subtitle: Text(album.name),
        trailing: RoundedImage(
          borderRadius: 4,
          imageUrl: album.smallImageUrl,
        ),
        onTap: () async {
          await services<NavigationService>().pushNamed(
            Routes.albumDetails,
            arguments: album,
          );
        },
      ),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    );
  }
}
