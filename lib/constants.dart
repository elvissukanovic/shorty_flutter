import 'package:flutter/material.dart';
import 'package:shorty_flutter/database/database.dart';

Color get shortyBlack => const Color(0xFF1C222A);
Color get shortyDarkGray => const Color(0xFF2F3744);
Color get shortyGray => const Color(0xFFA2A6B8);
Color get shortyPrimary => Colors.teal;

BorderRadius get shortyRadius => BorderRadius.circular(16);
double get shortyModalWidth => 600;

String shortcutImagePath(ShortcutType type) {
  switch (type) {
    case ShortcutType.file:
      return 'assets/images/lamp_icon.png';
    case ShortcutType.folder:
      return 'assets/images/folder_icon.png';
    case ShortcutType.web:
      return 'assets/images/globe_icon.png';
  }
}
