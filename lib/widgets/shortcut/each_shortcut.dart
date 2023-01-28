import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shorty_flutter/database/database.dart';
import 'package:native_context_menu/native_context_menu.dart' as ctx;
import 'package:shorty_flutter/helper.dart';
import 'package:shorty_flutter/widgets/shortcut/shortcut_image.dart';
import 'dart:io';
import 'package:window_manager/window_manager.dart';

class EachShortcut extends StatefulWidget {
  const EachShortcut({Key? key, required this.shortcut}) : super(key: key);

  final Shortcut shortcut;

  @override
  State<EachShortcut> createState() => _EachShortcutState();
}

class _EachShortcutState extends State<EachShortcut> {
  actionTest() {}

  runShortcut() async {
    //print()
    //Process.run(shortcut.shortcut, []);
    var ctrlPressed = RawKeyboard.instance.keysPressed.contains(LogicalKeyboardKey.controlLeft);
    Process.start('explorer', ['https:/www.google.com']);
    if (!ctrlPressed) await windowManager.minimize();
    //if (!ctrlPressed) await windowManager.close();
    /*
    switch (shortcut.type) {
      case ShortcutType.file:
        //"C:\Users\elvis\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Chrome Apps\YouTube Music.lnk"
        Process.start('explorer', ['D:\\aaa.txt']);
        break;
      case ShortcutType.folder:
        Process.start('explorer', ['D:\\_tmp']);
        break;
      case ShortcutType.web:
        Process.start('explorer', ['https:/www.google.com']);
        break;
    }*/
  }

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    //var appState = context.watch<MyAppState>();
    //var ooo = appState.allGroupsList;

    return ctx.ContextMenuRegion(
      //onDismissed: () => print('Menu was dismissed'),
      //onItemSelected: (item) => {item.onSelected!(), print('${item.title} was selected')},
      menuItems: [
        ctx.MenuItem(title: 'Edit Shortcut', onSelected: () => actionTest()),
        ctx.MenuItem(title: 'Delete Shortcut', onSelected: () => actionTest()),
      ],
      child: Tooltip(
        verticalOffset: -90,
        message: widget.shortcut.shortcut,
        child: AnimatedContainer(
          width: 120,
          height: 120,
          margin: const EdgeInsets.all(15),
          duration: const Duration(milliseconds: 0),
          decoration: BoxDecoration(
            color: Colors.teal,
            //color: isHover ? Colors.black54 : Colors.black45,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              if (isHover)
                const BoxShadow(
                  color: Colors.tealAccent,
                  blurRadius: 6,
                ),
            ],
          ),
          child: InkWell(
            onTap: () => {runShortcut()},
            onHover: (val) => {
              setState(() {
                isHover = val;
              })
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(children: [
                  Text(
                    widget.shortcut.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: shortyBlack, fontSize: 14),
                  ),
                  const SizedBox(height: 12), // <-- Set heigh
                  ShortcutImage(widget.shortcut)
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
