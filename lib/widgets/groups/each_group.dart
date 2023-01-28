import 'package:flutter/material.dart';
import 'package:native_context_menu/native_context_menu.dart' as ctx;
import 'package:provider/provider.dart';
import 'package:shorty_flutter/helper.dart';
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
            return AlertDialog(
              title: const Text("Edit group"),
              content: AddGroupForm(group: frontEndGroup.group),
            );
          });
    }

    actionAddShortcut() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Add Shortcut"),
              content: AddShortcutForm(groupId: frontEndGroup.group.id),
            );
          });
    }

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
      margin: const EdgeInsets.fromLTRB(50, 15, 50, 15),
      padding: const EdgeInsets.all(15),
      //color: Colors.black12,
      decoration: BoxDecoration(
        color: shortyBlack,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 200,
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
              style: const TextStyle(color: Colors.teal, fontSize: 15),
              "${frontEndGroup.group.title} (${frontEndGroup.group.id.toString()})",
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
