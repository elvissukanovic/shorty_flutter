import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shorty_flutter/database/database.dart';

import '../../constants.dart';
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
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        width: shortyModalWidth,
        height: 290,
        child: Column(
          children: <Widget>[
            widgetTitle(shortcut != null ? "Edit shortcut" : "Add shortcut"),
            widgetTextFormField("Title"),
            widgetTextFormField("Shortcut"),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16), backgroundColor: shortyPrimary, foregroundColor: shortyBlack),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      if (shortcut != null) {
                        appState.updateShortcut(shortcut!.id, newTitle, newShortcut, groupId);
                      } else {
                        appState.createShortcut(newTitle, newShortcut, groupId);
                      }
                    }
                  },
                  child: const Text('Save'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text widgetTitle(String label) {
    return Text(
      label,
      style: TextStyle(color: shortyPrimary, fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  TextFormField widgetTextFormField(String label) {
    return TextFormField(
        style: TextStyle(color: shortyPrimary),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: shortyPrimary,
            fontSize: 16,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: shortyPrimary),
          ),
        ),
        initialValue: shortcut?.title,
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onChanged: (value) => {if (label == "Title") newTitle = value, if (label == "Shortcut") newShortcut = value});
  }
}
