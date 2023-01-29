import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shorty_flutter/widgets/groups/add_group.dart';
import 'package:window_manager/window_manager.dart';
import '../../constants.dart';
import '../../state.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({super.key});

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> with WindowListener {
  var focusNode = FocusNode();
  final _controller = TextEditingController();
  late MyAppState appState;

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowRestore() {
    _controller.clear();
    FocusScope.of(context).requestFocus(focusNode);
    appState.filterGroups("");
  }

  actionAddGroup() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: shortyDarkGray,
            shape: RoundedRectangleBorder(borderRadius: shortyRadius),
            child: AddGroupForm(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    appState = context.watch<MyAppState>();
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 50, top: 10),
            child: TextButton(
              onPressed: () => {
                actionAddGroup(),
              },
              child: Text(
                "Add group",
                style: TextStyle(color: shortyPrimary),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 15),
          child: TextField(
            controller: _controller,
            focusNode: focusNode,
            style: TextStyle(color: shortyPrimary, fontSize: 22),
            textAlign: TextAlign.center,
            onChanged: (value) => {appState.filterGroups(value)},
            decoration: InputDecoration(
              hintText: "Search",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: shortyPrimary),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
