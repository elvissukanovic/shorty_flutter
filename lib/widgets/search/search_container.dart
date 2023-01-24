import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shorty_flutter/widgets/groups/add_group.dart';
import '../../state.dart';
//import 'package:provider/provider.dart';
//import '../../main.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({super.key});

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    var appState = context.watch<MyAppState>();

    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(12.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
            ),
            hintText: 'Search',
            hintStyle: TextStyle(color: Color.fromARGB(255, 155, 146, 65)),
          ),
          onChanged: (value) => {appState.filterGroups(value)},
        ),
        FloatingActionButton(
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
        ),
      ],
    );
  }
}
