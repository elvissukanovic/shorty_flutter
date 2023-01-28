import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shorty_flutter/widgets/groups/add_group.dart';
import 'package:window_manager/window_manager.dart';
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
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Add group"),
                        content: AddGroupForm(),
                      );
                    }),
              },
              child: const Text(
                "Add group",
                style: TextStyle(color: Colors.teal),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(54, 15, 54, 15),
          child: TextField(
            controller: _controller,
            focusNode: focusNode,
            style: const TextStyle(color: Colors.teal, fontSize: 22),
            textAlign: TextAlign.center,
            onChanged: (value) => {appState.filterGroups(value)},
            decoration: const InputDecoration(
              hintText: "Search",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
