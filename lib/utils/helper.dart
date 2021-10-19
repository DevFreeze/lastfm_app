import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dialog_helpers/show_snackbar.dart';

class Helper {
  static Future<void> launchURL(BuildContext context, String url) async {
    await canLaunch(url)
        ? await launch(url)
        : showSnackBar(
            context: context,
            text: tr('cant_launch_url'),
            actionText: tr('ok'),
            onPressed: () {},
          );
  }
}
