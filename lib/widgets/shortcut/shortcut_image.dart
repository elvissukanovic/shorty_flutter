import 'package:flutter/material.dart';
import 'package:shorty_flutter/constants.dart';
import 'package:shorty_flutter/database/database.dart';

class ShortcutImage extends StatelessWidget {
  const ShortcutImage(this.shortcut, {super.key});

  final Shortcut shortcut;

  @override
  Widget build(BuildContext context) {
    return widgetImage(shortcut.type);
  }

  Image widgetImage(ShortcutType type) {
    return Image.asset(
      shortcutImagePath(type),
      height: 50,
      width: 50,
    );
  }
}
