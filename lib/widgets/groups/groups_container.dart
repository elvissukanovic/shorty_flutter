import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state.dart';
import 'each_group.dart';

class GroupsContainer extends StatefulWidget {
  const GroupsContainer({super.key});

  @override
  State<GroupsContainer> createState() => _GroupsContainerState();
}

class _GroupsContainerState extends State<GroupsContainer> {
  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    var appState = context.watch<MyAppState>();
    //var ooo = appState.allGroupsList;
    return Expanded(
      child: ListView(children: <Widget>[
        for (var eachGroup
            in appState.allFrontEndGroupsList.where((x) => x.visible))
          EachGroup(frontEndGroup: eachGroup)
      ]),
    );
  }
}
