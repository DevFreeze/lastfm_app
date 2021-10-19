import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../theme/textstyles.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          tr('error_message'),
          style: TextStyles.title2,
        ),
      ),
    );
  }
}
