import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state.dart';
import 'groups/groups_container.dart';
import 'search/search_container.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    context.watch<MyAppState>();
    return Scaffold(
      //backgroundColor: Colors.amberAccent,
      body: Column(
        children: const <Widget>[
          SearchContainer(),
          SizedBox(height: 10), // <-- Set heigh
          GroupsContainer(),
        ],
      ),
    );
  }
}
