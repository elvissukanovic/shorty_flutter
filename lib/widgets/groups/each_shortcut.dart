import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shorty_flutter/database/database.dart';
import 'package:native_context_menu/native_context_menu.dart' as ctx;

class EachShortcut extends StatelessWidget {
  const EachShortcut({Key? key, required this.shortcut}) : super(key: key);

  final Shortcut shortcut;

  actionTest() {}

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
      child: Container(
        margin: const EdgeInsets.all(15),
        color: Colors.black45,
        width: 120,
        height: 120,
        child: InkWell(
          onTap: () => {
            //print(RawKeyboard.instance.keysPressed.contains(LogicalKeyboardKey.controlLeft)            )
          },
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            //onEnter: (event) => {print(event)},
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(children: [
                Text(
                  shortcut.title,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15), // <-- Set heigh
                Image.asset(
                  'assets/images/lamp_icon.png',
                  height: 50,
                  width: 50,
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
