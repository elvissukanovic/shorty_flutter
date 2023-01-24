import 'dart:async';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'database/database.dart';

class MyAppState extends ChangeNotifier {
  final database = MyAppDatabase();
  List<FrontEndGroup> allFrontEndGroupsList = [];
  //List<Group> allGroupsList = [];

  MyAppState() {
    reloadAllGroups();

    //createShortcut("title", "shortcut", 1);
    //createShortcut("title 2", "shortcut", 1);
  }

  // GROUPS
  reloadAllGroups() {
    allFrontEndGroupsList = [];

    FrontEndGroup tmpGroup;
    getAllShortcuts().then((allShortcuts) => {
          getAllGroups().then((allGroups) => {
                for (var group in allGroups)
                  {
                    tmpGroup = FrontEndGroup(group: group),
                    tmpGroup.shortcuts = allShortcuts.where((eachShortcut) => eachShortcut.groupId == group.id).toList(),
                    allFrontEndGroupsList.add(tmpGroup)
                  },
                notifyListeners()
              })
        });
  }

  filterGroups(String filter) {
    for (var eachGroup in allFrontEndGroupsList) {
      if (eachGroup.group.title.contains(filter)) {
        eachGroup.visible = true;
      } else {
        eachGroup.visible = false;
      }
    }
    notifyListeners();
  }

  Future<List<Group>> getAllGroups() async {
    return await database.select(database.groups).get();
  }

  Future<Group> getGroup(int groupId) async {
    return await (database.select(database.groups)..where((x) => x.id.equals(groupId))).getSingle();
  }

  Future<void> createGroup(String title) async {
    await database.into(database.groups).insert(GroupsCompanion(
        //title: Value(title), hide: const Value(false), order: const Value(0)));
        title: Value(title)));
    reloadAllGroups();
  }

  Future<void> updateGroup(int id, String title, int order) async {
    (database.update(database.groups)..where((x) => x.id.equals(id))).write(GroupsCompanion(order: Value(order), title: Value(title)));
    reloadAllGroups();
  }

  deleteGroup(Group group) async {
    await database.delete(database.groups).delete(group);
    reloadAllGroups();
  }

  // SHORTCUTS
  Future<List<Shortcut>> getAllShortcuts() async {
    return await database.select(database.shortcuts).get();
  }

  Future<List<Shortcut>> getAllShortcutsPerGroup(int groupId) async {
    return await (database.select(database.shortcuts)..where((x) => x.groupId.equals(groupId))).get();
  }

  Future<Shortcut> getShortcut(int shortcutId) async {
    return await (database.select(database.shortcuts)..where((x) => x.id.equals(shortcutId))).getSingle();
  }

  //createShortcut(ShortcutsCompanion shortcut) async {
  createShortcut(String title, String shortcut, int groupId) async {
    var shortcutType = ShortcutType.file;
    if (shortcut.contains("http") || shortcut.contains("www")) {
      shortcutType = ShortcutType.web;
    }

    var newShortcutId = await database
        .into(database.shortcuts)
        .insert(ShortcutsCompanion(title: Value(title), shortcut: Value(shortcut), groupId: Value(groupId), type: Value(shortcutType)));

    //var newShortcut = await getShortcut(newShortcutId);

    reloadAllGroups();
  }

  updateShortcut(int id, String title, String shortcut, int groupId) async {
    var shortcutType = ShortcutType.file;
    if (shortcut.contains("http") || shortcut.contains("www")) {
      shortcutType = ShortcutType.web;
    }

    var newShortcutId = await database
        .into(database.shortcuts)
        .insert(ShortcutsCompanion(title: Value(title), shortcut: Value(shortcut), groupId: Value(groupId), type: Value(shortcutType)));

    //var newShortcut = await getShortcut(newShortcutId);

    reloadAllGroups();
  }

  deleteShortcut(Shortcut shortcut) async {
    await database.delete(database.shortcuts).delete(shortcut);
  }

  // var current = WordPair.random();
  // var history = <WordPair>[];

  // GlobalKey? historyListKey;

  // void getNext() {
  //   history.insert(0, current);
  //   var animatedList = historyListKey?.currentState as AnimatedListState?;
  //   animatedList?.insertItem(0);
  //   current = WordPair.random();
  //   notifyListeners();
  // }

  // var favorites = <WordPair>[];

  // void toggleFavorite([WordPair? pair]) {
  //   pair = pair ?? current;
  //   if (favorites.contains(pair)) {
  //     favorites.remove(pair);
  //   } else {
  //     favorites.add(pair);
  //   }
  //   notifyListeners();
  // }

  // void removeFavorite(WordPair pair) {
  //   favorites.remove(pair);
  //   notifyListeners();
  // }
}

class FrontEndGroup {
  Group group;
  bool visible = true;
  List<Shortcut> shortcuts = [];

  FrontEndGroup({required this.group});
}
