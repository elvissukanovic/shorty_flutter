import 'package:flutter/material.dart';
import 'package:shorty_flutter/helper.dart';
import 'groups/groups_container.dart';
import 'search/search_container.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //context.watch<MyAppState>();
    return Scaffold(
      backgroundColor: shortyDarkGray,
      body: Column(
        children: const <Widget>[
          SearchContainer(),
          //SizedBox(height: 10), // <-- Set heigh
          GroupsContainer(),
        ],
      ),
    );
  }
}
