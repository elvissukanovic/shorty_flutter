import 'package:flutter/material.dart';
import 'package:native_context_menu/native_context_menu.dart' as ctx;
import 'package:provider/provider.dart';
import 'package:shorty_flutter/constants.dart';
import 'package:shorty_flutter/state.dart';
import 'package:shorty_flutter/widgets/shortcut/add_shortcut.dart';
import 'package:shorty_flutter/widgets/shortcut/each_shortcut.dart';
import 'add_group.dart';

class EachGroup extends StatelessWidget {
  const EachGroup({Key? key, required this.frontEndGroup});

  final FrontEndGroup frontEndGroup;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    actionEditGroup() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              backgroundColor: shortyDarkGray,
              shape: RoundedRectangleBorder(borderRadius: shortyRadius),
              child: AddGroupForm(group: frontEndGroup.group),
            );
          });
    }

    actionAddShortcut() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              backgroundColor: shortyDarkGray,
              shape: RoundedRectangleBorder(borderRadius: shortyRadius),
              //title: const Text("Add Shortcut"),
              child: AddShortcutForm(groupId: frontEndGroup.group.id),
            );
          });
    }

    /*
    // white default dialog
    actionAddShortcut2() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Add Shortcut"),
              content: AddShortcutForm(groupId: frontEndGroup.group.id),
            );
          });
    }
    */

    actionMoveUp() async {
      await appState.moveGroupUp(frontEndGroup.group.id);
    }

    actionMoveDown() async {
      await appState.moveGroupDown(frontEndGroup.group.id);
    }

    actionDeleteGroup() {
      appState.deleteGroup(frontEndGroup.group);
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      padding: const EdgeInsets.all(10),
      //color: Colors.black12,
      decoration: BoxDecoration(
        color: shortyBlack,
        borderRadius: shortyRadius,
      ),
      height: 192,
      child: Column(
        children: [
          ctx.ContextMenuRegion(
            //onDismissed: () => print('Menu was dismissed'),
            onItemSelected: (item) => {item.onSelected!()},
            menuItems: [
              ctx.MenuItem(title: 'Edit Group', onSelected: () => actionEditGroup()),
              ctx.MenuItem(title: 'Add Shortcut', onSelected: () => actionAddShortcut()),
              ctx.MenuItem(title: 'Move Up', onSelected: () => actionMoveUp()),
              ctx.MenuItem(title: 'Move Down', onSelected: () => actionMoveDown()),
              ctx.MenuItem(title: 'Delete Group', onSelected: () => actionDeleteGroup()),
            ],
            child: Text(
              frontEndGroup.group.title,
              style: TextStyle(color: shortyPrimary, fontSize: 16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[for (var eachShortcut in frontEndGroup.shortcuts) EachShortcut(shortcut: eachShortcut)],
          ),
        ],
      ),

      //constraints: BoxConstraints.tightForFinite(height: 200, width: 900),
    );
  }
}
