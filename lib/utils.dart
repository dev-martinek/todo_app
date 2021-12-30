import 'package:flutter/material.dart';

Color customColor({String? date}) {
  switch (date) {
    case 'Today':
      return Colors.blue;
    case 'Yesterday':
      return Colors.pink;
    case 'Tomorrow':
      return Colors.purple;
    default:
      return Colors.grey;
  }
}
