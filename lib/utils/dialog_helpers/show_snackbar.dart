import 'package:flutter/material.dart';

Future<void> showSnackBar({
  required BuildContext context,
  required String text,
  required String actionText,
  required VoidCallback onPressed,
}) async {
  final _snackBar = SnackBar(
    content: Text(text),
    action: SnackBarAction(
      label: actionText,
      onPressed: onPressed,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(_snackBar);
}
