import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shorty_flutter/database/database.dart';
import '../../constants.dart';
import '../../state.dart';

class AddGroupForm extends StatelessWidget {
  AddGroupForm({super.key, this.group});
  Group? group;

  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  var newTitle = "";

  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    var appState = context.watch<MyAppState>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      width: shortyModalWidth,
      height: 215,
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                widgetTitle(group != null ? "Edit group" : "Add group"),
                widgetTextFormField("Title"),
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
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          if (group != null) {
                            appState.updateGroup(group!.id, newTitle, group!.order);
                          } else {
                            appState.createGroup(newTitle);
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
        ],
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
        initialValue: group?.title,
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onChanged: (value) => {if (label == "Title") newTitle = value});
  }
}
