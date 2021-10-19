import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../models/album.dart';
import '../../utils/helper.dart';
import '../theme/textstyles.dart';
import '../widgets/rounded_image.dart';

class AlbumDetailView extends StatelessWidget {
  final Album album;

  const AlbumDetailView({
    Key? key,
    required this.album,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: RoundedImage(
                  borderRadius: 12,
                  imageUrl: album.bigImageUrl,
                ),
              ),
              Text(
                album.artist,
                style: TextStyles.title1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                album.name,
                style: TextStyles.title2,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RichText(
                  text: TextSpan(
                    text: tr('open_link'),
                    style: TextStyles.link,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Helper.launchURL(
                            context,
                            album.url,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
