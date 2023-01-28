import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shorty_flutter/database/database.dart';
import '../../state.dart';

class AddShortcutForm extends StatelessWidget {
  AddShortcutForm({super.key, required this.groupId, this.shortcut});
  final int groupId;
  Shortcut? shortcut;

  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  var newTitle = "";
  var newShortcut = "";

  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    var appState = context.watch<MyAppState>();
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // Add TextFormFields and ElevatedButton here.
              TextFormField(
                  initialValue: shortcut?.title,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) => newTitle = value),
              TextFormField(
                  initialValue: shortcut?.shortcut,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) => newShortcut = value),
              ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );

                    if (shortcut != null) {
                      appState.updateShortcut(shortcut!.id, newTitle, newShortcut, groupId);
                    } else {
                      appState.createShortcut(newTitle, newShortcut, groupId);
                    }
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
