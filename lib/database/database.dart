import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

// assuming that your file is called filename.dart. This will give an error at
// first, but it's needed for drift to know about the generated code
part 'database.g.dart';

// This will make drift generate a class called "Category" to represent a row in
// this table. By default, "Categorie" would have been used because it only
//strips away the trailing "s" in the table name.
// @DataClassName('Category')
class Groups extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 2, max: 32)();
  IntColumn get order => integer().withDefault(const Constant(0))();
  bool hide = false;
}

// this will generate a table called "shortcuts" for us. The rows of that table will
// be represented by a class called "Shortcut".
class Shortcuts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 2, max: 32)();
  TextColumn get shortcut => text()();
  IntColumn get groupId => integer()();
  TextColumn get type => textEnum<ShortcutType>()();
}

enum ShortcutType { web, file, folder }

// this annotation tells drift to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@DriftDatabase(tables: [Groups, Shortcuts])
class MyAppDatabase extends _$MyAppDatabase {
  // we tell the database where to store the data with this constructor
  MyAppDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    final file = File('myappdatabase.sqlite');
    return NativeDatabase.createInBackground(file);
  });
}
