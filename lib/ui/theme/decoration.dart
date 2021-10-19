import 'package:flutter/material.dart';

final textInputDecoration = InputDecoration(
  isDense: true,
  contentPadding: EdgeInsets.symmetric(
    vertical: 5,
    horizontal: 10,
  ),
  focusColor: Colors.white,
  enabledBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(18),
    ),
    borderSide: BorderSide(
      color: Colors.grey.shade300,
      width: 1.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(18),
    ),
    borderSide: BorderSide(
      color: Colors.grey,
      width: 1.0,
    ),
  ),
);
