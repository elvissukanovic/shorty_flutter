import 'package:flutter/material.dart';
import 'package:shorty_flutter/database/database.dart';

class ShortcutImage extends StatelessWidget {
  const ShortcutImage(this.shortcut, {super.key});

  final Shortcut shortcut;

  @override
  Widget build(BuildContext context) {
    if (shortcut.type == ShortcutType.file) {
      return Image.asset(
        'assets/images/lamp_icon.png',
        height: 50,
        width: 50,
      );
    }

    if (shortcut.type == ShortcutType.folder) {
      return Image.asset(
        'assets/images/folder_icon.png',
        height: 50,
        width: 50,
      );
    }

    //if (shortcut.type == ShortcutType.web) {
    return Image.asset(
      'assets/images/globe_icon.png',
      height: 50,
      width: 50,
    );
    //}
  }
}
